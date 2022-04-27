class WeatherService
  class << self

    def connection
      Faraday.new(url: 'https://api.openweathermap.org/data/2.5/') do |faraday|
        faraday.params['appid'] = ENV['weather_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def coordinate_weather(city_location)
      coordinates = MapService.city_coordinates(city_location)
      response = connection.get('onecall') do |faraday|
        faraday.params['lat'] = coordinates[:lat]
        faraday.params['lon'] = coordinates[:lng]
        faraday.params['units'] = 'imperial'
      end
      parse_json(response)
    end
  end
end
