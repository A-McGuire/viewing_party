class UsersController < ApplicationController

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:info] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path
    else
      redirect_to root_path
      flash[:alert] = 'Invalid credentials' # TODO: make this case sensitive,
      # email already exists, or passwords dont match
    end
  end

  def index; end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
