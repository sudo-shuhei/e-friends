class PostsController < ApplicationController
  before_action :sign_in_required ,only: [:new, :edit, :create, :update, :destroy]
  PER = 8

  def index
    @posts = Post.all.order(createde_at: :desc)
    @posts = Post.page(params[:page]).per(PER)
    set_prev_search_params
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id:params[:id])
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

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id:params[:id])
    if @post.update(title: params[:title], game:params[:game], platform:params[:platform], comment:params[:comment])
      flash[:notice] = "編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to("/posts/index")
  end

  def set_prev_search_params
    prev_q = URI(request.referer).query
    prev_params = Rack::Utils.parse_nested_query(prev_q)
    params[:q] = prev_params['q']
  end
end
