class Item < ActiveRecord::Base
	validates :title, :text, :price, :image, :quantity, presence: true
end
