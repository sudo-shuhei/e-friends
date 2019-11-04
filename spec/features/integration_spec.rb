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
   scenario "user requests" do
     user1 = FactoryBot.create(:user)
     user2 = FactoryBot.create(:user, email: "another_user@example.com")
     @post = FactoryBot.create(:post, user: user1)
     sign_in user2
     visit "/posts/#{@post.id}"
     click_link "リクエスト"
     fill_in "comment", with: "フレンドになりましょう"
     click_button "送信"
     expect(page).to have_content "リクエストを送信しました"
   end
   scenario "user accept a request" do
     user1 = FactoryBot.create(:user, name: "user1")
     user2 = FactoryBot.create(:user, email: "another_user@example.com")
     @post = FactoryBot.create(:post, user: user1)
     @request = Request.new(
       post_id: @post.id,
       user_id: user2.id,
       comment: "フレンドになりましょう",
       post_user_id: user1.id)
       @request.save
     sign_in user1
     visit root_path
     click_link "リクエストが届いています"
     click_link "承認"
     #expect(current_path).to eq "/message/#{user1.id}-#{user2.id}"
     expect(page).to have_content "リクエストを承認しました! メッセージを送りましょう"
   end
   scenario "user deny a request" do
     user1 = FactoryBot.create(:user, name: "user1")
     user2 = FactoryBot.create(:user, email: "another_user@example.com")
     @post = FactoryBot.create(:post, user: user1)
     @request = Request.new(
       post_id: @post.id,
       user_id: user2.id,
       comment: "フレンドになりましょう",
       post_user_id: user1.id)
       @request.save
     sign_in user1
     visit root_path
     expect{
       click_link "リクエストが届いています"
       click_link "×"
     }.to change(user2.requests, :count).by(-1)
   end
end
