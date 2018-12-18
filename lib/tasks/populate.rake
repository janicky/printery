require "faker"

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task["db:reset"].invoke if Rails.env.development?

    User.create(
      first_name: "Example",
      last_name: "Example",
      email: "example@example.com",
      password: "example",
    )

    5.times do
      User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
      )
    end

    20.times do
      Company.create(
        name: Faker::SiliconValley.company,
        tax_number: Faker::Number.number(10),
        address: Faker::Address.full_address,
      )
    end

    color_palette_names = %w[CMYK CMYK+P354 CMYK+P8381 CMYK+REFLEX P2756+P375 P8085+K+Y CMYK+5KOL]
    color_palette_names.each do |color_name|
      ColorPalette.create(
        name: color_name,
        price: Faker::Commerce.price(0.04...0.2),
      )
    end

    paper_names = %w[Alaska GC1 GRAFION SAMPACK PRIMA\ BOX Kreda LPET]
    10.times do
      Paper.create(
        name: paper_names.sample,
        grammage: Faker::Number.between(200, 400),
        price: Faker::Commerce.price(0.05...1),
      )
    end

    paper_dimensions = [
      { name: "A10", width: 26, height: 37 },
      { name: "A9", width: 37, height: 52 },
      { name: "A8", width: 52, height: 74 },
      { name: "A7", width: 74, height: 105 },
      { name: "A4", width: 210, height: 297 },
      { name: "A2", width: 420, height: 594 },
      { name: "A0", width: 841, height: 1189 },
      { name: "B0", width: 1000, height: 1414 },
      { name: "C0", width: 917, height: 1297 },
    ]
    paper_dimensions.each do |paper|
      PaperSize.create(
        name: paper[:name],
        width: paper[:width],
        height: paper[:height],
        multiplier: Faker::Commerce.price(0.1...2),
      )
    end

    machine_types = %w[printer cutter gluing refinment]
    letters = ("A"..."Z").to_a
    10.times do
      Machine.create(
        name: "#{letters.sample}#{Faker::Number.between(1, 10)}",
        type: machine_types.sample,
        since_cleaning: Faker::Number.between(0, 300),
      )
    end

    20.times do
      count = [*500...100000].sample
      Order.create(
        company: Company.find(Company.pluck(:id).sample),
        price: Faker::Commerce.price(0.2...5) * count,
        count: count,
        deadline: Time.current + [*7...30].sample.days,
        description: Faker::Lorem.sentence,
        paper_size: PaperSize.find(PaperSize.pluck(:id).sample),
        paper: Paper.find(Paper.pluck(:id).sample),
        color_palette: ColorPalette.find(ColorPalette.pluck(:id).sample),
      )
    end

    30.times do |i|
      Operation.create(
        order: Order.find(Order.pluck(:id).sample),
        machine: Machine.find(Machine.pluck(:id).sample),
        status: [0, 1, 2, 3].sample,
        priority: i,
      )
    end

    Order.all.each do |order|
      next unless order.status == 3

      ReleaseReceipt.create(
        order: order,
        release_date: Time.current + [*2...10].sample.hours,
        user: User.find(User.pluck(:id).sample),
        price: order.price,
      )
    end
  end
end
