class Notification < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :to_user_id

  validates :content, presence: true, length: {maximum: 100}
  validates :post_id, :to_user_id, presence: true
end
