class SongsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @song = Song.find(params[:id])
    @comment = Comment.new
    @comment.save
    @comments = @song.comments
    @favorite = Favorite.new
    @vote = Vote.new
    @categories = Category.all
    @category = Category.find(params[:id])
    # if Vote.where(category_id == @category.id && song_id == @song.id)
    #   @vote.destroy
    #   @vote.create
    # end
  end

  def new
    @song = Song.new
    @categories = Category.all
  end

  def create
    @user = current_user
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.upate(song_params)
    redirect_to song_path(@song)
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to root_path
  end

  private

  def song_params
    params.require(:song).permit(:user_id, :category_id, :name, :artist, :description, :youtube_url)
  end
end
