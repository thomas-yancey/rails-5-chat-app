class MessagesChannel < ApplicationCable::Channel

  def subscribed
    stream_from "messages_#{params[:room]}"
  end

  def unsubscribed
  end

end