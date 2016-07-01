class RoomsController < ApplicationController
  before_action :activate_session

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end


end

