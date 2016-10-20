class UsersController < ApplicationController
  before_action :require_login, except: [:create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def create
  	@user = User.new(user_params)
  	if @user.save()
      session[:user_id] = @user.id
  		redirect_to '/users/' + @user.id.to_s
  	else
  		flash[:reg_errors] = @user.errors.full_messages
  		redirect_to '/'
  	end
  end

  def login
	@user = User.find_by_email(params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to "/users/#{current_user.id}"
  	else
  		flash[:login_errors] = ['Invalid login information, what ARE YOU DOING WITH YOUR LIFE?!?!']
  		redirect_to '/'
  	end
  end

  def show
  	@user = User.find(params[:id])
    @messages = Message.all
  end

  def edit
    @user = params[:id]
  end

  def update
  end

  def destroy
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
