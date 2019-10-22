class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def show
    @user = User.find_by(id: params[:id])
    @room_id = message_room_id(current_user.id, @user.id)
    @posts = Post.where(user_id: @user.id)
  end
  def index
    @users = User.all
  end
end
