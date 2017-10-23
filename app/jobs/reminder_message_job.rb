class ReminderMessageJob < ApplicationJob
  queue_as :default

  def perform(message, user_id = '')
    #ApplicationController.renderer.render(partial: 'welcome/index', locals: { message: message })
    ActionCable.server.broadcast "room_channel#{user_id}",
                                 message: message
    
  end

  private

    def render_message(message)
      #render(partial: 'welcome/message', locals: { message: message })
      ApplicationController.renderer.render(partial: 'welcome/message', locals: { message: message })
    end
end
