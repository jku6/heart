class HrmSession < ActiveRecord::Base

  paginates_per 1
  has_many :hrm_data_points, :select => 'id, hrm_session_id, beats_per_minute, duration_in_secs'
  belongs_to :user

end