class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :activate_session, :verify_logged_in, :redirect_with_flash, :member_of_group

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

  def verify_logged_in
    unless logged_in?
      flash[:notice] = "You must be logged in to view that page"
      redirect_to root_path
    end
  end

  def member_of_group
    !!@room.memberships.find_by(user_id: current_user.id)
  end

  def redirect_with_flash
    flash[:notice] = "You are not a member of that room"
    redirect_to root_path
  end

end
