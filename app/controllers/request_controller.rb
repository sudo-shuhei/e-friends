class RequestController < ApplicationController
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
end
