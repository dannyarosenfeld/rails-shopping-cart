FactoryGirl.define do
  factory :item do
    title { Faker::Hipster.word}
    text { Faker::Hipster.sentence}
    price { Faker::Commerce.price}
    image { Faker::Avatar.image}
  end
end
