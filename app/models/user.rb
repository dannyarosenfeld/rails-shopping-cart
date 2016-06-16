class User < ActiveRecord::Base
  has_secure_password
  validates :name, :username, :email, :password, presence: true
  validates :username, uniqueness: true
end
