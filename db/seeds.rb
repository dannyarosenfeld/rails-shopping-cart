Category.delete_all
Item.delete_all
User.delete_all
CategoriesItem.delete_all

User.create(name: "Tim", username: "tim", email: "tim@tim.com", password: "timtim", admin: true)
User.create(name: "Tom", username: "tom", email: "tom@tom.com", password: "tomtom")

categories = ["Books", "Music", "Cool things", "Instruments", "Apparel"]

categories.each do |category|
  Category.create(title: category)
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
