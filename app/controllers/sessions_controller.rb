class SessionsController < ApplicationController
  skip_before_action :require_login

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

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
