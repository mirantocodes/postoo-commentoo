class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_right_user, only: [:edit, :update, :destroy]

  def index
    store_url
    @posts = Post.all
    @post = Post.new
  end

  def show
    store_url
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_back_or_to root_path
    else
      @posts = Post.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_back_or root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

  def require_login
    unless logged_in?
      flash[:notice] = "Require login!"
      redirect_back_or_to root_path
    end
  end

  def require_right_user
    unless @_current_user.id == Post.find(params[:id]).user_id
      flash[:notice] = "Require right user!"
      redirect_back_or_to root_path
    end
  end
end
