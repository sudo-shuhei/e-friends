class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title],
      user_id: current_user.id,
      game: params[:game],
      platform: params[:platform],
      comment: params[:comment]
    )
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
end
