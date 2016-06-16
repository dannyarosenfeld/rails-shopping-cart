class Item < ActiveRecord::Base
  has_and_belongs_to_many :categories
	validates :title, :text, :price, :image, :quantity, presence: true
end
