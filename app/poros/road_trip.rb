class RoadTrip
  attr_reader :travel_time,
              :temp,
              :conditions

  def initialize(data, weather)
    @travel_time = seconds_to_hours(data[:route][:legs][0][:time])
    @travel_time_minutes = (data[:route][:legs][0][:time] / 60)
    @hours = determine_hours(@travel_time_minutes)
    @temp = weather[@hours - 1][:temp]
    @conditions = weather[@hours - 1][:weather][0][:description]
  end

  def seconds_to_hours(seconds)
    minutes = seconds / 60
    "#{minutes / 60} hours and #{minutes % 60} minutes"
  end

  def determine_hours(minutes)
    (minutes / 60.0).round
  end
end
