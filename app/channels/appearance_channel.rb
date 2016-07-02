class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    stream_from "appearance_#{params[:room]}"
    ActionCable.server.broadcast "appearance_#{params[:room]}", data: current_user
  end

  def unsubscribed
  end

  def appear(data)

  end

end