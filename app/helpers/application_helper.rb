module ApplicationHelper



  def save_categories(categories)
    @item.categories = []
    categories.each do |cat_id|
      @item.categories << Category.find(cat_id)
    end
  end
end
