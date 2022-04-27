class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:daily][0][:dt]).strftime('%F')
    @sunrise = Time.at(data[:daily][0][:sunrise]).to_s
    @sunset = Time.at(data[:daily][0][:sunset]).to_s
    @max_temp = data[:daily][0][:temp][:max]
    @min_temp = data[:daily][0][:temp][:min]
    @conditions = data[:daily][0][:weather][0][:description]
    @icon = data[:daily][0][:weather][0][:icon]
  end
end
