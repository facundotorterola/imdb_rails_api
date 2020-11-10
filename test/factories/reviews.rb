# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    description { Faker::Lorem.paragraph }
    title { Faker::Movie.quote }
    rate { Faker::Number.between(from: 1, to: 10) }

    # Pruebo esto ya que cree 10 usuarios y 10 movies antes
    movie_id { Faker::Number.between(from: 12, to: 51) }
    user_id { Faker::Number.between(from: 1, to: 41) }
  end
end
