class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :activate_session

  def current_user
    return unless session[:user]
    @current_user ||= User.find(session[:user])
  end

  def logged_in?
    !!session[:user]
  end

  def activate_session
    session[:init] = true
  end

end
