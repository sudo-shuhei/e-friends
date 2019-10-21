class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  # Send message to other user
  def send_message(other_user, room_id, content)
    from_messages.create!(to_user_id: other_user.id, room_id: room_id, content: content)
  end
end
