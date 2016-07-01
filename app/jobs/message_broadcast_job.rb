class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "messages_#{message.room_id}", message: render_message(message)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end

end
