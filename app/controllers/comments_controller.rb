class CommentsController < ApplicationController
  def create
  	@post = Post.find(param[:post_id])
		@comment = @post.comments.create!(params[:comment])
		@comment.destroy
		redirect_to post_path(@post)
  end

  def destroy
  	@post = Post.find(param[:post_id])
		@comment = @post.comments.find(params[:id])
		redirect_to post_path(@post)
  end
end
