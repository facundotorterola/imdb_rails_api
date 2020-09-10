FactoryBot.define do
    factory :movie do
      title { Faker::Book.title }
      director { Faker::Name.name }
      year{ Faker::Number.within((1960..2020))}
      description { Faker::Lorem.paragraph}
    end
  end
  