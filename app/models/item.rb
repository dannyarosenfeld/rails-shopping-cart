class Item < ActiveRecord::Base
	validates :title, presence: true
	validates :text, presence: true
	validates :price, presence: true
	validates :image, presence: true
end
