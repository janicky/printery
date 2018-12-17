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

    color_palettes = %w[CMYK CMYK+P354 CMYK+P8381 CMYK+REFLEX P2756+P375 P8085+K+Y CMYK+5KOL]
    color_palettes.each do |color_name|
      ColorPalette.create(
        name: color_name,
        price: Faker::Commerce.price(0.8...1.5),
      )
    end
  end
end
