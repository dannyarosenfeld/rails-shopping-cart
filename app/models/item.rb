class Item < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :carts
  has_many :users, through: :carts
	validates :title, :text, :price, :image, :quantity, presence: true

end
