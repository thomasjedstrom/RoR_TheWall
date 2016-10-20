class MessagesController < ApplicationController
	before_action :require_login
  def create
  	message = Message.create(content: params[:content], user: current_user)
  	redirect_to "/users/#{current_user.id}"
  end

  def destroy
  	message = Message.find(params[:id])
	message.destroy if message.user == current_user
	redirect_to "/users/#{current_user.id}"  	
  end
end
