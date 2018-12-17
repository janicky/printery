require "faker"

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task["db:reset"].invoke if Rails.env.development?

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
        price: Faker::Commerce.price(2...4.5),
      )
    end

    paper_names = %w[Alaska GC1 GRAFION SAMPACK PRIMA\ BOX Kreda LPET]
    10.times do
      Paper.create(
        name: paper_names.sample,
        grammage: Faker::Number.between(200, 400),
        price: Faker::Commerce.price(0.5...2),
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
        multiplier: Faker::Commerce.price(0.8...4),
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
  end
end
