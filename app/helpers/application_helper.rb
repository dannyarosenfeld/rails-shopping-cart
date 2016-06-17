module ApplicationHelper

  def save_categories(categories)
    @item.categories = []
    categories.each do |cat_id|
      @item.categories << Category.find(cat_id)
    end
  end

  def has_enough_stock(item_id, quantity_request)
    Item.find(item_id).quantity >= quantity_request.to_i
  end

end
