class User < ApplicationRecord
  validates_uniqueness_of :name
  validates_presence_of   :name
  validates_presence_of   :password_digest
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
end
