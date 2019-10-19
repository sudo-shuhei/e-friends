class Request < ApplicationRecord
  def user
    return User.find_by(id: self.user_id)
  end
  def post
    return Post.find_by(id: self.post_id)
  end
end
