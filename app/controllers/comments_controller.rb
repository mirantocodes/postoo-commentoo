class CommentsController < ApplicationController
  before_action :require_login
  before_action :require_right_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def require_login
    unless logged_in?
      flash[:notice] = "Please login or sign up!"
      post = Post.find(params[:post_id])
      redirect_to post_path(post)
    end
  end

  def require_right_user
    unless @_current_user.id == Comment.find(params[:id]).user_id
      flash[:notice] = "Require right user!"
      post = Post.find(params[:post_id])
      redirect_to post_path(post)
    end
  end
end
