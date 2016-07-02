class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    stream_from "appearance_#{params[:room]}"
    ActionCable.server.broadcast "appearance_#{params[:room]}", username: current_user.username
  end

  def unsubscribed
    ActionCable.server.broadcast "appearance_#{params[:room]}", username: current_user.username
  end

  def appear(data)

  end

end