class SessionsController < ApplicationController
  before_action :activate_session

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user] = @user.id
      cookies.signed[:user] = session[:user]
      redirect_to rooms_path
    else
      @errors = @user.nil? ? ["username not found"] : @user.errors.full_messages
      render "/sessions/new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
