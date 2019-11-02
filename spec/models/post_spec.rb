require 'rails_helper'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "generates associated data from a factory" do
    post = FactoryBot.create(:post)
    puts "This post's user is #{post.user.inspect}"
  end
  it "is invalid without a title" do
    @post = Post.new(title: nil)
    @post.valid?
    expect(@post.errors[:title]).to include("can't be blank")
  end
  it "is invalid without a user_id" do
    @post = Post.new(user_id: nil)
    @post.valid?
    expect(@post.errors[:user_id]).to include("can't be blank")
  end
  it "is invalid without a game" do
    @post = Post.new(game: nil)
    @post.valid?
    expect(@post.errors[:game]).to include("can't be blank")
  end
  it "is invalid without a platform" do
    @post = Post.new(platform: nil)
    @post.valid?
    expect(@post.errors[:platform]).to include("can't be blank")
  end
  it "is invalid with a comment longer than 300" do
    @post = Post.new(comment: "a"*400)
    @post.valid?
    expect(@post.errors[:comment]).to include("is too long (maximum is 300 characters)")
  end
end
