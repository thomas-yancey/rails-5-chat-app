class UsersController < ApplicationController
  before_action :activate_session

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      @user.groups << Group.find(1)
      redirect_to groups_path
    else
      @errors = @user.errors.full_messages
      render "/users/new"
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
