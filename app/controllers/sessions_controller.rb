class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome, #{user.email}!"
      redirect_to dashboard_path
    else
      redirect_to root_path
      flash[:alert] = 'Invalid Credentials'
    end
  end
end
