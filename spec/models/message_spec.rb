require 'rails_helper'

RSpec.describe Message, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is invalid without a from_user_id" do
    message = Message.new(from_user_id: nil)
    message.valid?
    expect(message.errors[:from_user_id]).to include("can't be blank")
  end
  it "is invalid without a to_user_id" do
    message = Message.new(to_user_id: nil)
    message.valid?
    expect(message.errors[:to_user_id]).to include("can't be blank")
  end
  it "is invalid without a room_id" do
    message = Message.new(room_id: nil)
    message.valid?
    expect(message.errors[:room_id]).to include("can't be blank")
  end
  it "is invalid without a content" do
    message = Message.new(content: "")
    message.valid?
    expect(message.errors[:content]).to include("can't be blank")
  end
  it "is invalid with a content longer than 100" do
    @message = Message.new(content: "a"*200)
    @message.valid?
    expect(@message.errors[:content]).to include("is too long (maximum is 100 characters)")
  end
end
