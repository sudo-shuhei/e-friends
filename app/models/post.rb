class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  def user
    return User.find_by(id: self.user_id)
  end

  validates :title, {presence:true}
  validates :user_id, {presence:true}
  validates :game, {presence:true}
  validates :platform, {presence:true}
  validates :comment, {length:{maximum:300}}
end
