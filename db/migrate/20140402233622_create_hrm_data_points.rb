class CreateHrmDataPoints < ActiveRecord::Migration
  def change
    create_table :hrm_data_points do |t|
      t.integer :hrm_session_id
      t.integer :beats_per_minute
      t.date    :reading_start_time 
      t.date    :reading_end_time
      t.integer :duration_in_secs
      t.timestamps
    end
  end
end
