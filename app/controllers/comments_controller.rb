class CommentsController < ApplicationController
  def create
  	@comment = Comment.new(comment_params)
  	@comment.save
  	redirect_to song_path(@comment.song)
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@song = @comment.song
  	@comment.destroy
  	redirect_to song_path(@song)
  end

  private

  def comment_params
  	params.require(:comment).permit(:user_id, :song_id, :body)
  end
end
