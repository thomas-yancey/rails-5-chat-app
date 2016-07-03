class RoomsController < ApplicationController
  before_action :activate_session

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @users = @room.users
  end

  def index
    @rooms = current_user.rooms
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    binding.pry
    if @room.save
      @room.users << current_user
      redirect_to room_memberships_path(@room)
    else
      @errors = @room.errors.full_messages
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

end

