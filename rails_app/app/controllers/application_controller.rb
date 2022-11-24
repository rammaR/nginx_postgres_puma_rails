class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

  def current_user
    # Method using Session
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]

    # Method using cookies
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def logged_in?
    current_user != nil
  end

  def authorize
    redirect_to login_url, alert: 'Not Authorized' if current_user.nil?
  end

end