class SessionCalc

  def calculate_min id
    @data = HrmDataPoint.where(:hrm_session_id=> id)
    @data.map{|x| x.beats_per_minute}.min
  end

  def calculate_max id
    @data = HrmDataPoint.where(:hrm_session_id=> id)
    @data.map{|x| x.beats_per_minute}.max
  end

  def calculate_avg id
    @data = HrmDataPoint.where(:hrm_session_id=> id)
    @data.map{|x| x.beats_per_minute}.min
  end
end