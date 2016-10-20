require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = create_user
    @message = @user.messages.create(content: 'message')
    @comment = Comment.create(user: @user, message: @message, content: 'comment')
  end
  describe "when not logged in" do
  	it "does not allow you to create comments" do
      post :create
  		expect(response).to redirect_to(root_path)
  	end
  	it "does not allow you to delete comments" do
  		delete :destroy, id: @comment
      expect(response).to redirect_to(root_path)
  	end
  end
end
