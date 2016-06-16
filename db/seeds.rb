20.times do (
  category = Category.create(
    title: Faker::Commerce.product_name
    )
)
end

20.times do (
  categoriesitem = CategoriesItem.create(
    category_id: rand(1..20),
    item_id: rand(1..3)
  )
)
end
