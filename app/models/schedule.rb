class Schedule < ApplicationRecord
  after_commit :wakeup
  after_create :wakeup
  belongs_to :user
  
  def wakeup
    Scheduler.wake_up
  end
end
