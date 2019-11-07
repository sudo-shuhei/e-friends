require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "generates associated data from a factory" do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
    notification = Notification.new(
      to_user_id: @user.id,
      content: "フレンド申請が届いています",
      post_id: @post.id,
      post_user_id: @post.user_id
    )
    notification.save
    #puts "This notification's user is #{notification.user.inspect}"
  end
  it "is invalid without a to_user_id" do
    notification = Notification.new(to_user_id: nil)
    notification.valid?
    expect(notification.errors[:content]).to include("を入力してください")
  end
  it "is invalid without a content" do
    notification = Notification.new(content: "")
    notification.valid?
    expect(notification.errors[:content]).to include("を入力してください")
  end
  it "is invalid with a content longer than 100" do
    notification = Notification.new(content: "a"*150)
    notification.valid?
    expect(notification.errors[:content]).to include("は100文字以内で入力してください")
  end
  it "is invalid without a post_id" do
    notification = Notification.new(post_id: nil)
    notification.valid?
    expect(notification.errors[:post_id]).to include("を入力してください")
  end
end
