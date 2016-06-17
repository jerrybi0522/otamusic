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
    @vote = Vote.new
    @categories = Category.all

    @cute_votes = count(@song, @categories[0])
    @joyful_votes = count(@song, @categories[1])
    @melancholic_votes = count(@song, @categories[2])
    @psyched_votes = count(@song, @categories[3])
    @serene_votes = count(@song, @categories[4])
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

  def count(song, category)
    count = 0
    song.votes.each do |v|
      if v.category == category
        count+=1
      end
    end
    count
  end  

  private

  def song_params
    params.require(:song).permit(:user_id, :category_id, :name, :artist, :description, :youtube_url)
  end
end
