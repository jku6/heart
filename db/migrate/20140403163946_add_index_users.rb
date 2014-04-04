class AddIndexUsers < ActiveRecord::Migration
  def change
    add_index :users, :username, unique: true
    add_index :hrm_sessions, :user_id
    add_index :hrm_data_points, :hrm_session_id
  end
end
