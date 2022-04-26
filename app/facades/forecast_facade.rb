class ForecastFacade
  class << self
    def current_weather(location)
      forecast_hash = WeatherService.coordinate_weather(location)
      CurrentWeather.new(forecast_hash)
    end

    def daily_weather(location)
      forecast_hash = WeatherService.coordinate_weather(location)
      DailyWeather.new(forecast_hash)
    end

    def hourly_weather(location)
      forecast_hash = WeatherService.coordinate_weather(location)
      HourlyWeather.new(forecast_hash)
    end
  end
end
