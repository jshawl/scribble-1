class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order(created_at: :desc)
    # or Post.find(params[:post_id].comments)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  # You could also add in edit and update actions

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body, :post_id)
  end
end
