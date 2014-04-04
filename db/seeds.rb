# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


conn = ActiveRecord::Base.connection
rc = conn.raw_connection
rc.exec("COPY users (id, created_at, username, gender, age, hr_zone1_bpm_min, hr_zone1_bpm_max, hr_zone2_bpm_min, hr_zone2_bpm_max, hr_zone3_bpm_min, hr_zone3_bpm_max, hr_zone4_bpm_min, hr_zone4_bpm_max) FROM STDIN WITH CSV")
file = File.open('public/users.txt', 'r')
while !file.eof?
  rc.put_copy_data(file.readline)
end
rc.put_copy_end

conn2 = ActiveRecord::Base.connection
rc2 = conn2.raw_connection
rc2.exec("COPY hrm_sessions (id, user_id, created_at, duration_in_secs) FROM STDIN WITH CSV")
file = File.open('public/hrm_sessions.txt', 'r')
while !file.eof?
  rc2.put_copy_data(file.readline)
end
rc2.put_copy_end

conn3 = ActiveRecord::Base.connection
rc3 = conn3.raw_connection
rc3.exec("COPY hrm_data_points (id, hrm_session_id, beats_per_minute, reading_start_time, reading_end_time, duration_in_secs) FROM STDIN WITH CSV")
file = File.open('public/hrm_data_points.txt', 'r')
while !file.eof?
  rc3.put_copy_data(file.readline)
end
rc3.put_copy_end





# while res = rc.get_result
#   if e_message = res.error_message
#     puts e_message
#   end
# end

