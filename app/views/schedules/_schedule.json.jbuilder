json.extract! schedule, :id, :user_id, :run_at, :priority, :message, :next_month, :next_week, :next_day, :next_minutes, :valid_days, :start_time, :end_time, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
