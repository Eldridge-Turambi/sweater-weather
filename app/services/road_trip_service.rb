class RoadTripService
  class << self

    def connection
      Faraday.new(url: 'http://www.mapquestapi.com/directions/v2/') do |faraday|
        faraday.params['key'] = ENV['mapquest_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def road_trip_data(start_location, end_location)
      response = connection.get('route') do |faraday|
        faraday.params['from'] = start_location
        faraday.params['to'] = end_location
      end
      parse_json(response)
    end
  end
end
