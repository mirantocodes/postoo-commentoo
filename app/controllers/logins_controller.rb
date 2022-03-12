class LoginsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_path, status: :see_other
  end
end
