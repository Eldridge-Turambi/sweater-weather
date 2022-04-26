class RoadTrip

  def initialize(data)
    @travel_time = seconds_to_hours(data[:route][:legs][0][:time])
  end

  def seconds_to_hours(seconds)
    minutes = seconds / 60
    "#{minutes / 60} hours and #{minutes % 60} minutes"
  end
end
