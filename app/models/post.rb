class Post < ApplicationRecord
  validates :title, {presence:true}
  validates :user_id, {presence:true}
  validates :game, {presence:true}
  validates :platform, {presence:true}
  validates :comment, {length:{maximum:300}}
end
