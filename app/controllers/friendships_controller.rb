class FriendshipsController < ApplicationController
  
  def create 
    friend = User.find_by(email: params[:email])

    friendship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
    if friendship.save
      flash[:notice] = "Added friend."
      redirect_to dashboard_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to dashboard_path
    end
  end
end