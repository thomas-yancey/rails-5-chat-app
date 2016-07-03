class UsersController < ApplicationController
  before_action :activate_session

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      cookies.signed[:user] = session[:user]
      @user.rooms << Room.find(1)
      redirect_to rooms_path
    else
      @errors = @user.errors.full_messages
      render "/users/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
