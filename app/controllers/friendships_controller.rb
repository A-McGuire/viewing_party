class FriendshipsController < ApplicationController
  
  def create 
    friend = User.find_by(email: params[:email])
    if friend.present?
        friendship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
      if friendship.save
        flash[:notice] = "Added friend."
        redirect_to dashboard_path
      else
        flash[:error] = "Unable to add friend."
        redirect_to dashboard_path
      end
    else
      redirect_to dashboard_path
      flash[:error] = "User not found"
    end
  end
end