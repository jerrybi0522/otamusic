class VotesController < ApplicationController
	def create
  	@vote = Vote.new(user_id: current_user.id, song_id: params[:song_id], category_id: params[:category_id])
  	@song = Song.find(params[:id])
  	@vote.save
  	# Change to ujs
  	redirect_to song_path(@song)
  end

  def destroy
  	@vote = Vote.find(params[:id])
  	@song = Song.find(@vote.song_id)
  	@vote.destroy
  	# Change to ujs
  	redirect_to song_path(@song)
  end
end
