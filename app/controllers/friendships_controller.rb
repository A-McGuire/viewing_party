class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend.present?
      friendship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
      if friendship.save
        flash[:notice] = 'Added friend.'
      else
        flash[:error] = 'Unable to add friend.'
      end
    else
      flash[:error] = 'User not found'
    end
    redirect_to dashboard_path
  end
end
