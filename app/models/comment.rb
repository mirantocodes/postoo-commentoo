class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :recent, -> { order(created_at: 'DESC') }
end
