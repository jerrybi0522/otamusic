class VotesController < ApplicationController
	def create
    @song = Song.find(params[:vote][:song_id])
    v = Vote.where("user_id = ? AND song_id = ?", current_user.id, params[:vote][:song_id])

    if v && v!= []
      Vote.destroy(v.first.id)
    end

  	@vote = Vote.new(user_id: current_user.id, song_id: params[:vote][:song_id], category_id: params[:vote][:category_id])
    respond_to do |format|
      if @vote.save
        format.js
      else
        format.html { redirect_to :back }
      end
    end

  	# redirect_to song_path(@song)
  end

  def update
    @vote = Vote.find(params[:id])
    respond_to do |format|
      if @vote.update(vote_params)
        format.js
      else
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
  	@vote = Vote.find(params[:id])
  	@song = Song.find(@vote.song_id)
  	@vote.destroy
  	# Change to ujs
  	redirect_to song_path(@song)
  end

  def clear_all
    Vote.where("song_id = ?", params[:id]).delete_all
    # respond_to do |format|
    #   format.js
    # end
    redirect_to :back
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :song_id, :category_id)
  end
end
