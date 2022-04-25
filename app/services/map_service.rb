class MapService
  class << self

    def connection
      Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
        faraday.params['key'] = ENV['mapquest_key']
      end
    end

    def directions_connection
      Faraday.new(url: 'http://www.mapquestapi.com/directions/v2/') do |faraday|
        faraday.params['key'] = ENV['mapquest_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def city_coordinates(city)
      response = connection.get('address') do |faraday|
        faraday.params['location'] = city
      end
      parse_json(response)[:results][0][:locations][0][:latLng]
    end

    def directions_and_time(start_location, end_location)
      response = directions_connection.get('route') do |faraday|
        faraday.params['from'] = start_location
        faraday.params['to'] = end_location
      end
      parse_json(response)
    end
  end
end
