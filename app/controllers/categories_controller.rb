class CategoriesController < ApplicationController
  def index
  	@cute = Category.find(1)
  	@joyful = Category.find(2)
  	@melancholic = Category.find(3)
  	@psyched = Category.find(4)
  	@serene = Category.find(5)
    
    # Finds a song at random under each category
  	@random_cute = Category.find(1).songs.all.sample
  	@random_joyful = Category.find(2).songs.all.sample
  	@random_melancholic = Category.find(3).songs.all.sample
  	@random_psyched = Category.find(4).songs.all.sample
  	@random_serene = Category.find(5).songs.all.sample
  end

  def show
  	@category = Category.find(params[:id])
  	@songs = @category.songs
  end

  # def random
  # 	@category = Category.find(params[:id])
  # 	@songs = @category.songs
  # 	@song = @songs.sample
  # 	link_to song_path(@song)
  # end
end