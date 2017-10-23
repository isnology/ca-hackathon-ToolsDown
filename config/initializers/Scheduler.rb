
class Scheduler
  def start
    Thread.new do
      sleep 10
      puts "Scheduler started"
      one_day = 86400
      while true
        Schedule.uncached do
          @job = false
          @job = Schedule.order(:run_at, :priority).first
          if @job
            if time_to_run?
              if valid_day_to_run?
                action
              end
              new_run_date
              @sleep_time = 0
            else
              @sleep_time = new_wait_time
            end
          else
            @sleep_time = one_day
          end
        end
        if @sleep_time > 0
          @@sleep = Thread.new do
            puts "sleeping for #{@sleep_time} seconds"
            sleep @sleep_time
          end
          @@sleep.join
        end
      end
    end
  end
  
  def self.wake_up
    @@sleep.run
  end
  
  private

    def action
      ActionCable.server.broadcast "room_channel#{@job.user_id}", message: @job.message
    end
  
    def new_run_date
      if @job.next_month == 0 && @job.next_week == 0 && @job.next_day == 0 && @job.next_minutes == 0
        @job.destroy
      else
        if @job.next_month > 0
          @job.run_at += @job.next_month.months
        elsif @job.next_week > 0
          @job.run_at += @job.next_week.weeks
        elsif @job.next_day > 0
          @job.run_at += @job.next_day.days
        else
          @job.run_at += @job.next_minutes.minutes
        end
        @job.save
      end
    end
  
    def new_wait_time
      (@job.run_at - DateTime.now.change(offset: "+0000")) - 1
    end
  
    def valid_day_to_run?
      @job.valid_days.split('').find_index(Time.now.wday.to_s)
    end
  
    def time_to_run?
      DateTime.now.change(offset: "+0000") >= @job.run_at
    end
end

Scheduler.new.start