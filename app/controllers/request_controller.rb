class RequestController < ApplicationController
  before_action :sign_in_required, only: [:form, :create, :accept, :reject]

  def form
    @post = Post.find_by(id:params[:id])
    @request = Request.new
  end

  def create
    @post = Post.find_by(id:params[:id])
    @request = Request.new(
      post_id: @post.id,
      user_id: params[:from_user_id],
      comment: params[:comment],
      post_user_id: @post.user_id
    )
    if @request.save
      flash[:notice] = "リクエストを送信しました"
      redirect_to("/posts/index")
    else
      render("posts/request_form")
    end
  end

  def index
    @requests = Request.where(post_user_id: current_user.id)
  end

  def not_exist?(user1, user2)
    friend1 = Friend.where(from_user_id: user1, to_user_id: user2)
    friend2 = Friend.where(from_user_id: user2, to_user_id: user1)
    if friend1.blank? && friend2.blank?
      return true
    else
      return false
    end
  end

  def accept
    @request = Request.find_by(id:params[:id])
    #フレンドモデルに追加
    if not_exist?(@request.user_id, @request.post_user_id)
      friend1 = Friend.new(from_user_id: @request.user_id, to_user_id: @request.post_user_id)
      friend2 = Friend.new(from_user_id: @request.post_user_id, to_user_id: @request.user_id)
      friend1.save
      friend2.save
    end
    notification = Notification.new(
      to_user_id: @request.user_id,
      content: "リクエストが承認されました",
      post_id: @request.post_id,
      message_type: "accepted",
      post_user_id: @request.post_user_id )
    notification.save

    @request.destroy
    flash[:notice] = "リクエストを承認しました! メッセージを送りましょう"

    room_id = message_room_id(current_user.id, @request.user_id)
    redirect_to "/message/#{room_id}"   #DMにリダイレクト
  end

  def reject
    @request = Request.find_by(id:params[:id])
    @request.destroy
    redirect_to("/request/index")
  end
end
