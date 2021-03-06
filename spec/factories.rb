FactoryGirl.define do
  factory :cart do
    
  end
  factory :categories_item do
    
  end
  factory :category do
    
  end
  factory :user do
    
  end
  factory :item do
    title { Faker::Hipster.word}
    text { Faker::Hipster.sentence}
    price { Faker::Commerce.price}
    image { Faker::Avatar.image}
    quantity { rand(1..50) }
  end
end
