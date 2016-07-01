class MessagesController < ApplicationController
  before_action :activate_session

  def create
    @message = Message.new(message_params)
    @message.save
  end

  def index
    room = params[:room_id]
    messages = room.messages
    render json: messages
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :content).merge(user_id: current_user.id)
  end
end
