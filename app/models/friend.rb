class Friend < ApplicationRecord
  validates :from_user_id, :to_user_id, presence: true
  #def friends(id)
  #  f = Friend.where(from_user_id: id)
  #end
end
