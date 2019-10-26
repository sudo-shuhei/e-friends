require 'rails_helper'

RSpec.describe Notification, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is invalid without a to_user_id" do
    notification = Notification.new(to_user_id: nil)
    notification.valid?
    expect(notification.errors[:content]).to include("can't be blank")
  end
  it "is invalid without a content" do
    notification = Notification.new(content: "")
    notification.valid?
    expect(notification.errors[:content]).to include("can't be blank")
  end
  it "is invalid with a content longer than 100" do
    notification = Notification.new(content: "a"*150)
    notification.valid?
    expect(notification.errors[:content]).to include("is too long (maximum is 100 characters)")
  end
  it "is invalid without a post_id" do
    notification = Notification.new(post_id: nil)
    notification.valid?
    expect(notification.errors[:post_id]).to include("can't be blank")
  end
  it "is invalid without a post_user_id" do
    notification = Notification.new(post_user_id: nil)
    notification.valid?
    expect(notification.errors[:post_user_id]).to include("can't be blank")
  end
end
