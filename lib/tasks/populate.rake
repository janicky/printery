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
  end
end
