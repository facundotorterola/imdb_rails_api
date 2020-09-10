FactoryBot.define do
  factory :review do
    description { "MyText" }
    title { "MyString" }
    rate { 1 }
    user { nil }
    movie { nil }
  end
end
