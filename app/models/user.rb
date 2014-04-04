class User < ActiveRecord::Base
  has_many :hrm_sessions, :select => 'id, user_id, created_at, duration_in_secs'
  has_many :hrm_data_points, through: :hrm_sessions, :select => 'id, hrm_session_id, beats_per_minute, duration_in_secs'
  validates :username, uniqueness: true

  def deliver
        @all = HrmSession.includes(:hrm_data_points, :user).order(created_at: :desc).find(:all, :select => 'id, user_id, created_at')
    zone1 = []
    zone2 = []
    zone3 = []
    zone4 = []


    # if GC.respond_to?(:copy_on_write_friendly=)
    #   GC.copy_on_write_friendly = true
    # end

    # jobs_per_process = 100
    # process_count = HrmSession.all.size

    # HrmSession.includes(:hrm_data_points, :user).find_in_batches(:batch_size => jobs_per_process * process_count) do |group|
    #   batches = group.in_groups(process_count)

    #   batches.each do |batch|
    #     Process.fork do
    #       ActiveRecord::Base.establish_connection

    #       # Do the actual work
    #       batch.each do |x| 
    #         zone1 << zone(x.hrm_data_points, x.user.hr_zone1_bpm_min, x.user.hr_zone1_bpm_max)
    #         zone2 << zone(x.hrm_data_points, x.user.hr_zone2_bpm_min, x.user.hr_zone2_bpm_max)
    #         zone3 << zone(x.hrm_data_points, x.user.hr_zone3_bpm_min, x.user.hr_zone3_bpm_max)
    #         zone4 << zone(x.hrm_data_points, x.user.hr_zone4_bpm_min, x.user.hr_zone4_bpm_max)

    #       end
    #         totalzone = zone1.compact+zone2.compact+zone3.compact+zone4.compact
    #         @zone1percent = zone1.compact.inject(:+).to_f / totalzone.inject(:+).to_f
    #         @zone2percent = zone2.compact.inject(:+).to_f / totalzone.inject(:+).to_f
    #         @zone3percent = zone3.compact.inject(:+).to_f / totalzone.inject(:+).to_f
    #         @zone4percent = zone4.compact.inject(:+).to_f / totalzone.inject(:+).to_f






    #     end
    #   end

    #   Process.waitall
    # end








    @all.each do |x|
      zone1 << zone(x.hrm_data_points, x.user.hr_zone1_bpm_min, x.user.hr_zone1_bpm_max)
      zone2 << zone(x.hrm_data_points, x.user.hr_zone2_bpm_min, x.user.hr_zone2_bpm_max)
      zone3 << zone(x.hrm_data_points, x.user.hr_zone3_bpm_min, x.user.hr_zone3_bpm_max)
      zone4 << zone(x.hrm_data_points, x.user.hr_zone4_bpm_min, x.user.hr_zone4_bpm_max)
    end


    totalzone = zone1.compact+zone2.compact+zone3.compact+zone4.compact
    @zone1percent = zone1.compact.inject(:+).to_f / totalzone.inject(:+).to_f
    @zone2percent = zone2.compact.inject(:+).to_f / totalzone.inject(:+).to_f
    @zone3percent = zone3.compact.inject(:+).to_f / totalzone.inject(:+).to_f
    @zone4percent = zone4.compact.inject(:+).to_f / totalzone.inject(:+).to_f
  end

end