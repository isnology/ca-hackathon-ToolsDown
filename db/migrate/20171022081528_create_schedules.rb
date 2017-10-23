class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :user, foreign_key: true
      t.datetime :run_at
      t.integer :priority
      t.string :message
      t.integer :next_month
      t.integer :next_week
      t.integer :next_day
      t.integer :next_minutes
      t.string :valid_days
      t.time :start_time
      t.time :end_time
      
      t.timestamps
      t.index ["run_at", "priority"], name: "index_schedule_on_run_at_and_priority"
    end
  end
end

