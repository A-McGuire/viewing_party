class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    
    if new_user.save
      session[:user_id] = new_user.id
      flash[:info] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path
    end
  end

  def show
    
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end