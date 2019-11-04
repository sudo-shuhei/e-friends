class Request < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :post_user_id, presence: true
  validates :comment, length: {maximum: 300}

  def user
    return User.find_by(id: self.user_id)
  end
  def post
    return Post.find_by(id: self.post_id)
  end
end
