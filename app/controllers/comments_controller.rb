class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		redirect_to post_path(@post)
  end

  def update
    # attr_accessiable :name과 동일
    post_params = params.require(:post).permit(:body)
    if @post.update_attributes(post_params)
      redirect_to @post, notice: 'Updated'
    else
      render action: 'edit'
    end
  end

  def destroy
  	@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
    @comment.destroy
		redirect_to post_path(@post)
  end
end
