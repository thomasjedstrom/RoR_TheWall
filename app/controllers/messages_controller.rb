class MessagesController < ApplicationController
  def create
  	message = Message.create(content: params[:content], user: current_user)
  	redirect_to "/users/#{current_user.id}"
  end

  def destroy
  	Message.destroy(params[:id])
	redirect_to "/users/#{current_user.id}"  	
  end
end
