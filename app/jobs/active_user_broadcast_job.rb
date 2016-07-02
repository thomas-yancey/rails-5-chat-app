class ActiveUserBroadcastJob < ApplicationJob

  def perform
    username = current_user.username
    ActionCable.server.broadcast "appearance_#{params[:room]}", user: username
  end

end