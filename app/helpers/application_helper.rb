module ApplicationHelper

  def checked_categories(hash)
    cats = hash.select do |key,value|
      value == "1"
    end
    cats.keys
  end

  def save_categories(categories)
    categories.each do |cat|
      @item.categories << Category.find_by(title: cat)
    end
  end
end
