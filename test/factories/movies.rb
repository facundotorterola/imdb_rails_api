# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    director { Faker::Name.name }
    year { Faker::Number.between(from: 1930, to: 2020) }
    description { Faker::Lorem.paragraph }
  end
end
