class CreateHrmSessions < ActiveRecord::Migration
  def change
    create_table :hrm_sessions do |t|
      t.integer :user_id
      t.date    :created_at
      t.integer :duration_in_secs
      t.timestamps
    end
  end
end
