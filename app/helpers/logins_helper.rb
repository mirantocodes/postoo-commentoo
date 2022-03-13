module LoginsHelper
  def current_user
    @_current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def redirect_back_or(default_url)
    redirect_to(session[:forwarding_url] || default_url)
    session.delete(:forwarding_url)
  end

  def store_url
    session[:forwarding_url] = request.original_url
  end

end
