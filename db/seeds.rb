category = ["Books", "Music", "Cool things", "Instruments", "Apparel"]

category.each do |cat|
  Category.create(title: cat)
end
# 20.times do (
#   category = Category.create(
#     title: Faker::Hipster.word
#     )
# )
# end

20.times do (
  item = Item.create(
    title: Faker::Commerce.product_name,
    text: Faker::Hipster.words.join,
    price: Faker::Commerce.price,
    quantity: rand(1..5),
    image: Faker::Avatar.image
    )
)
end



20.times do (
  categoriesitem = CategoriesItem.create(
    category_id: rand(1..5),
    item_id: rand(1..20)
  )
)
end
