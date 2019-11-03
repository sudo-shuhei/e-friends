require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  #include PostSupport
  scenario "user creates a new post" do
    user = FactoryBot.create(:user)
    sign_in user
    visit root_path

    expect {
      click_link "新規投稿"
      within "#postform" do
        fill_in "title", with: "フレンド募集中！"
        fill_in "game", with: "samplegame"
        select "PC", from: "platform"
        #fill_in "comment", with: "aiueo"
      end
        click_button "投稿"

      expect(page).to have_content "投稿しました"
    }.to change(user.posts, :count).by(1)
  end
   scenario "user change a post" do
     user = FactoryBot.create(:user)
     @post = FactoryBot.create(:post, user: user)
     sign_in user
     visit "/posts/#{@post.id}"
     click_link "編集"
     within "#postform" do
       fill_in "title", with: "New Title"
       fill_in "game", with: "newgame"
       select "PS4", from: "platform"
       #fill_in "comment", with: "aiueo"
     end
     click_button "決定"
     expect(page).to have_content "編集しました"
   end
   scenario "user destroy a post" do
     user = FactoryBot.create(:user)
     @post = FactoryBot.create(:post, user: user)
     sign_in user
     visit "/posts/#{@post.id}"
     click_link "削除"
     expect(page).to have_content "削除しました"
   end
   scenario "user "
end
