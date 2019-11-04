require 'rails_helper'

RSpec.describe Message, type: :model do
  it "generates associated data from a factory" do
    def message_room_id(first_user_id, second_user_id)
      if first_user_id < second_user_id
        "#{first_user_id}-#{second_user_id}"
      else
        "#{second_user_id}-#{first_user_id}"
      end
    end
    @post = FactoryBot.create(:post)
    user1 = FactoryBot.create(:user, name: "user1")
    user2 = FactoryBot.create(:user, name: "user2", email: "another_user@example.com")
    message = Message.new(
      from_user_id: user1.id,
      to_user_id: user2.id,
      content: "こんにちは！",
      room_id: message_room_id(user1.id,user2.id)
    )
    message.save
    #puts "This message's user is #{message.user.inspect}"
  end
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
