class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted"
    redirect_to root_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
