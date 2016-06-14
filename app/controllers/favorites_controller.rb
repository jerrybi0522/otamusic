class FavoritesController < ApplicationController
  def create
  	@favorite = Favorite.new(user_id: current_user.id, song_id: params[:id])
  	@song = Song.find(params[:id])
  	@favorite.save
  	# Change to ujs
  	redirect_to song_path(@song)
  end

  def destroy
  	@favorite = Favorite.find(params[:id])
  	@song = Song.find(@favorite.song_id)
  	@favorite.destroy
  	# Change to ujs
  	redirect_to song_path(@song)
  end
end
