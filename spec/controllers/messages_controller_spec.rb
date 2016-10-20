require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before do
    @user = create_user
    @message = @user.messages.create(content: "message")
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access create" do
      post :create
      expect(response).to redirect_to(root_path)
    end
    it "cannot access destroy" do
      delete :destroy, id: @message
      expect(response).to redirect_to(root_path)
    end
  end
  describe "when logged in as the wrong user" do
    before do
      @wrong_user = create_user 'jane', 'smith', 'julius@lakers.com'
      session[:user_id] = @wrong_user.id
      @message = @user.messages.create(content: 'message')
    end
    it "cannot access destroy" do
      delete :destroy, id: @message, user_id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end
