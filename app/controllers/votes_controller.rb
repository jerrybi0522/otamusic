class VotesController < ApplicationController
	def create
    @song = Song.find(params[:vote][:song_id])
    v = Vote.where("user_id = ? AND song_id = ?", current_user.id, params[:vote][:song_id])

    if v && v!= []
      Vote.destroy(v.first.id)
    end

  	@vote = Vote.new(user_id: current_user.id, song_id: params[:vote][:song_id], category_id: params[:vote][:category_id])
  	@vote.save

  	# Change to ujs
    ##Vote.where(user_id: current_user.id && song_id: song.id)

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
