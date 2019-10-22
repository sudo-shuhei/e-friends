class FriendsController < ApplicationController
  def index
    @friends = Friend.where(from_user_id: current_user.id)
  end
end
