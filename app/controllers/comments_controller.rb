class CommentsController < ApplicationController
  def create
	comment = Comment.create(content: params[:content], user: current_user, message: Message.find(params[:message_id]))
  	redirect_to "/users/#{current_user.id}"  	
  end

  def destroy
	Comment.destroy(params[:id])
	redirect_to "/users/#{current_user.id}"  	
  end
end
