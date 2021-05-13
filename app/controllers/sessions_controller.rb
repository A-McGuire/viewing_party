class SessionsController < ApplicationController
  # def new
  # end

  def create
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    flash[:info] = "Welcome, #{user.email}!"
    redirect_to dashboard_path
  end
end