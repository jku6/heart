module ApplicationHelper

  def calculate_min array
    # @data = HrmDataPoint.where(:hrm_session_id=> id)
    array.map{|x| x.beats_per_minute}.min
  end

  def calculate_max array
    # @data = HrmDataPoint.where(:hrm_session_id=> id)
    array.map{|x| x.beats_per_minute}.max
  end

  def avg array
    # @data = HrmDataPoint.where(:hrm_session_id=> id)
    array.map{|x| x.beats_per_minute * x.duration_in_secs}.inject(:+) / array.map{|x| x.duration_in_secs}.inject(:+)
  end


  def zone array, zmin, zmax
    newarray = []
    array.each do |a|
      if a.beats_per_minute >= zmin && a.beats_per_minute <= zmax
        newarray << a.duration_in_secs
      end
    end
    return newarray.inject(:+)
  end

  def data_viz array
    new_array = []
    array.each do |x|
      new_array << x.beats_per_minute
    end
    return new_array
  end

end
