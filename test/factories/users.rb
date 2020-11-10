# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name }
    bio { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    password {'123'}
  end
end
