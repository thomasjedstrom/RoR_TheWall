class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	after_filter :set_header_for_iframe

	def require_correct_user
		user = User.find(params[:id])
		redirect_to "/users/#{current_user.id}" if current_user != user
	end

	def require_login
		redirect_to root_path if session[:user_id] == nil
  	end

	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	private
	def set_header_for_iframe
		response.headers.delete "X-Frame-Options" 
	end
end
