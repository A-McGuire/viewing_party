class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
  end

  private
  def user_params
    # params.require(:user).permit(:user_email, :user_password)
    params.permit(:user_email, :user_password)
  end
end