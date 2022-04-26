class CurrentWeather
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visability,
              :condition,
              :icon

  def initialize(data)
    @date_time = Time.at(data[:current][:dt]).to_s
    @sunrise = Time.at(data[:current][:sunrise]).to_s
    @sunset = Time.at(data[:current][:sunset]).to_s
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @condition = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end
end
