class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_permalink(params[:id])
    @songs = Song.where(user:  @user)
    @friendships = @user.all_friendships
  end
end
