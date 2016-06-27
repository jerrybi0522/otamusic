class FavoritesController < ApplicationController
  def create
    # Puts song into user's favorite list
  	@favorite = Favorite.new(user_id: current_user.id, song_id: params[:song_id])
  	@song = Song.find(params[:song_id])
    respond_to do |format|
  	  if @favorite.save
        format.js
      else
        format.html { redirect_to :back }
      end
    end
  	# redirect_to song_path(@song)
  end

  def destroy
  	@favorite = Favorite.find(params[:id])
  	@song = Song.find(@favorite.song_id)
  	@favorite.destroy
    respond_to do |format|
      format.js
    end
  	# redirect_to song_path(@song)
  end
end
