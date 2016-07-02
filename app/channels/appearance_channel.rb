class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    stream_from "appearance_#{params[:room]}"
    appear
  end

  def unsubscribed
    dissappear
  end

  def appear
    ActionCable.server.broadcast "appearance_#{params[:room]}", {username: current_user.username, user_id: current_user.id, appearance: true }
  end

  def dissappear
    ActionCable.server.broadcast "appearance_#{params[:room]}", {username: current_user.username, user_id: current_user.id, appearance: false }
  end

end