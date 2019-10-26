require 'rails_helper'

RSpec.describe Friend, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is invalid without a from_user_id" do
    friend = Friend.new(from_user_id: nil)
    friend.valid?
    expect(friend.errors[:from_user_id]).to include("can't be blank")
  end
  it "is invalid without a to_user_id" do
    friend = Friend.new(to_user_id: nil)
    friend.valid?
    expect(friend.errors[:to_user_id]).to include("can't be blank")
  end
end
