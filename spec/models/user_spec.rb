require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    it "is invalid without a name" do
      user = User.new(name: "", email: "", password: "00000000",
      password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a email" do
      user = User.new(name: "", email: "", password: "00000000",
      password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "is invalid without a password" do
      user = User.new(name: "", email: "", password: "",
      password_confirmation: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "is invalid with a duplicate email address" do
      User.create(
        name: "John",
        email:      "test@example.com",
        password:   "i-am-john"
      )

      @user = User.new(
        name: "Peter",
        email:      "test@example.com",
        password:   "i-am-peter"
      )

      @user.valid?
      expect(@user.valid?).to eq(false)
    end
    it "is invalid with different password and password_confirmation" do
      user = User.new(name: "", email: "", password: "akasatana",
      password_confirmation: "kakikukeko")
      expect(user.valid?).to eq(false)
    end
  end
end
