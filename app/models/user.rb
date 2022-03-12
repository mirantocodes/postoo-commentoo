class User < ApplicationRecord
  validates_uniqueness_of :name
  has_many :posts
  has_many :comments, through: :posts
  has_secure_password
end
