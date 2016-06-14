class Item < ActiveRecord::Base
	validates :title, :text, :price, :image, presence: true
end
