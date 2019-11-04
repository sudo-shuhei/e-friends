require 'rails_helper'

RSpec.describe Request, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "generates associated data" do
    user1 = FactoryBot.create(:user, name: "user1")
    user2 = FactoryBot.create(:user, email: "another_user@example.com")
    @post = FactoryBot.create(:post, user: user1)
    @request = Request.new(
      post_id: @post.id,
      user_id: user2.id,
      comment: "フレンドになりましょう",
      post_user_id: user1.id)
      @request.save
    #puts "This request's user is #{@request.user.inspect}"
  end
  it "is invalid without a post_id" do
    request = Request.new(post_id: "")
    request.valid?
    expect(request.errors[:post_id]).to include("can't be blank")
  end
  it "is invalid without a user_id" do
    request = Request.new(user_id: "")
    request.valid?
    expect(request.errors[:user_id]).to include("can't be blank")
  end
  it "is invalid without a post_user_id" do
    request = Request.new(post_user_id: "")
    request.valid?
    expect(request.errors[:post_user_id]).to include("can't be blank")
  end
  it "is invalid with a comment longer than 300" do
    request = Request.new(comment: "a"*400)
    request.valid?
    expect(request.errors[:comment]).to include("is too long (maximum is 300 characters)")
  end
end
