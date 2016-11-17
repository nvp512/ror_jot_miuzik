class FriendshipsController < ApplicationController


  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "#{@friendship.friend.username} added as a friend!"
      redirect_to users_path
    else
      flash[:notice] = "already friends with #{@friendship.friend.username}!"
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "removed friendship"
    redirect_to current_user
  end
end
