class SongsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @song = Song.find(params[:id])
    @comment = Comment.new
    @comment.save
    @comments = @song.comments
    if logged_in?
      @favorite = Favorite.where(user_id: current_user.id, song_id: @song.id).first
    end
    # you will add a conditional to check if a vote for this song has been made by this user
    # if so you will set @vote to that particular vote
    # otherwise you will set @vote to Vote.new
    if Vote.where(user_id: current_user.id, song_id: @song.id).first
      @vote = Vote.where(user_id: current_user.id, song_id: @song.id).first
    else
      @vote = Vote.new
    end
    @categories = Category.all
    @category = Category.find(@song.category_id)

    # @cute_votes = count(@song, @categories[0])
    # @joyful_votes = count(@song, @categories[1])
    # @melancholic_votes = count(@song, @categories[2])
    # @psyched_votes = count(@song, @categories[3])
    # @serene_votes = count(@song, @categories[4])

    @cute_votes = @song.count(@categories[0])
    @joyful_votes = @song.count(@categories[1])
    @melancholic_votes = @song.count(@categories[2])
    @psyched_votes = @song.count(@categories[3])
    @serene_votes = @song.count(@categories[4])
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
    @categories = Category.all
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
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
