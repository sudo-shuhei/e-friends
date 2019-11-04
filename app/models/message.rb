class Message < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :from_user_id

  default_scope -> {order(created_at: :asc)}

  # Validations
  validates :from_user_id, presence: true
  validates :to_user_id, presence: true
  validates :room_id, presence: true
  validates :content, presence: true, length: {maximum: 100}

  # Methods
  def Message.recent_in_room(room_id)
    where(room_id: room_id).last(500)
  end

end
