class HrmDataPoint< ActiveRecord::Base
  belongs_to :hrm_session, :select => 'id, user_id, created_at, duration_in_secs'

end