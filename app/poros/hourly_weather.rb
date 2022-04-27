class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:hourly][0][:dt]).strftime('%T')
    @data = data[:hourly][0][:temp]
    @conditions = data[:hourly][0][:weather][0][:description]
    @icon = data[:hourly][0][:weather][0][:icon]
  end
end
