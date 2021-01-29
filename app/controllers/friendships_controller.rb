class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend: friend)
    if current_user.save
      flash.now[:notice] = "Following #{friend.full_name}"
    else
      flash.now[:notice] = "There was something wrong"
    end
    redirect_to following_path
  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.find_by(friend_id: friend.id)
    friendship.destroy
    flash.now[:notice] = "#{friend.full_name} was successfully removed"
    redirect_to following_path
  end
end
