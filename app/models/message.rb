class Message < ApplicationRecord
  belongs_to :user, optional: true

  default_scope -> {order(created_at: :asc)}

  # Validations
  #validates :from_user_id, presence: true
  #validates :to_user_id, presence: true
  #validates :room_id, presence: true
  #validates :content, presence: true, length: {maximum: 50}

  # Methods
  def Message.recent_in_room(room_id)
    where(room_id: room_id).last(500)
  end

end
