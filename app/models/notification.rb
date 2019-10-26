class Notification < ApplicationRecord
  validates :content, presence: true, length: {maximum: 100}
  validates :post_id, :post_user_id, :to_user_id, presence: true
end
