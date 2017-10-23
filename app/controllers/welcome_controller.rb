class WelcomeController < ApplicationController
  def index
    #ReminderMessageJob.set(wait_until: 5.minute).perform_later("test message for user 1", current_user.id)
    #ReminderMessageJob.perform_later("test message for user 1", current_user.id)
    ActionCable.server.broadcast "room_channel#{current_user.id}",
                                 message: 'Test message from controller'
  end
end
