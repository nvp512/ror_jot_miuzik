class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @user = User.find_by_permalink(params[:id])
    @params_id = @user.id
    @friends = Friendship.where(user_id: @params_id)
  end

  def create

    @user_ids = params[:user_ids]
    @artist = params[:song][:name]


    if params[:user_add]
      @song = Song.create(song_uri: params[:song][:song_uri],
      song_name: params[:song][:song_name], user_id: current_user.id, added_by: current_user.username)
      redirect_to "/users/#{current_user.permalink}"
      flash[:notice] = "#{@song.song_name} added to your playlist!"
    else
      @user_ids.each do |userid|
        @song = Song.create(song_uri: params[:song][:song_uri],
        song_name: params[:song][:song_name], user_id: userid, added_by: current_user.username)
      end
      flash[:notice] = "#{@song.song_name} added to playlists!"
      # redirect_to root_path
      redirect_to("/search_results?search=#{escaped_search}")
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "#{@song.song_name} deleted from playlist"
    redirect_to "/users/#{current_user.permalink}"
  end

  private

  def song_params
    params.require(:song).permit(:song_uri, :user_id, :song_name, :added_by)
  end
end
