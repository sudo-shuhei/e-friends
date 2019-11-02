require 'rails_helper'

RSpec.describe "User", type: :system do
  before do
    user = FactoryBot.create(:user)
  end
  xit  "login" do
    visit '/login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Sign up'
    expect(page).to have_content 'login successfully'
  end
end
