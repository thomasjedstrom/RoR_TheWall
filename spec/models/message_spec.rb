require 'rails_helper'

RSpec.describe Message, type: :model do
	describe 'messages' do
		before do
			@user = create_user
			@message = @user.messages.create(content: 'message')
		end
		it 'belongs to a user' do
			expect(@message.user).to eq(@user)
		end
	end
end
