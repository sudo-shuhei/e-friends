module PostSupport
  def create_post(post)
    visit root_path
    click_link "新規投稿"
    within "#postform" do
      fill_in "title", with: post[:title]
      fill_in "game", with: post[:game]
      select post[:platform], from: "platform"
      #fill_in "comment", with: post[:comment]
    end
    click_button "投稿"
  end
end

RSpec.configure do |config|
  config.include PostSupport
end
