class ReminderMessageJob < ApplicationJob
  queue_as :urgent

  def perform(message)
    #ApplicationController.renderer.render(partial: 'welcome/index', locals: { message: message })
    WelcomeController.render(:index, assigns: { message: message })
  end
end
