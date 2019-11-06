class HomeController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc).limit(20)
  end
end
