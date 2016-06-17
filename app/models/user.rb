class User < ActiveRecord::Base
  has_many :carts
  has_many :items, through: :carts

  has_secure_password
  validates :name, :username, :email, :password, presence: true
  validates :username, uniqueness: true
end
