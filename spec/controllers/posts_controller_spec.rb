require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#new" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to be_success
      end
      it "returns a 200 response" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end
    context "as a guest" do
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "redirects to the sign-in page" do
        get :new
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to be_success
    end
  end
  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end
      # xit "create a post" do #current_userがうまくできないのでfeature_specへ
      #   post_params = FactoryBot.attributes_for(:post) #ハッシュで渡す
      #   sign_in @user
      #   current_user = @user
      #   puts current_user.id
      #   expect {
      #     post :create, params: {post: post_params}
      #   }.to change(@user.posts, :count).by(1)
      # end
    end
    context "as a guest" do
      it "returns a 302 response" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: {post: post_params}
        expect(response).to have_http_status "302"
      end
      it "redirects to the sign-in page" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: {post: post_params}
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
  describe "#update" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
        @test_post = FactoryBot.create(:post, user: @user)
        #puts @test_post.user_id
      end
      it "update a post" do
        post_params = FactoryBot.attributes_for(:post, title: "New Post Name") #ハッシュで渡す
        sign_in @user
        #puts post_params[:title]
        patch :update, params: {id: @test_post.id,
          title: post_params[:title],
          game: post_params[:game],
          platform: post_params[:platform],
          }
        expect(@test_post.reload.title).to eq "New Post Name"
      end
    end
    # context "as an unauthorized user" do
    #   before do
    #     @user = FactoryBot.create(:user)
    #     other_user = FactoryBot.create(:user)
    #     @post = FactoryBot.create(:post, user: other_user, title: "Old Title")
    #   end
    #   xit "does not update the post" do
    #     post_params = FactoryBot.attributes_for(:post, title: "New Title")
    #     sign_in @user
    #     patch :update, params: {id: @post.id,
    #       title: post_params[:title],
    #       game: post_params[:game],
    #       platform: post_params[:platform],
    #       }
    #     expect(response).to redirect_to "/posts/index"
    #   end
    #   it "redirects to the sign-in page" do
    #     post_params = FactoryBot.attributes_for(:post)
    #     sign_in @user
    #     patch :update, params: {id: @post.id, post: post_params}
    #     expect(response).to redirect_to "/users/sign_in"
    #   end
    # end
  end
end
