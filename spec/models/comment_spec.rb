require 'rails_helper'
RSpec.describe Comment, type: :model do
	describe 'comments' do
		before do
			@user = create_user
			@message = @user.messages.create(content: 'message')
			@comment = Comment.create(content: 'comment', user: @user, message: @message)
		end
		it 'belongs to a user' do
			expect(@comment.user).to eq(@user)
		end
		it 'belongs to a message' do
			expect(@comment.message).to eq(@message)
		end
	end
end
