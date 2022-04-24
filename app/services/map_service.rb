class MapService
  class << self

    def connection
      Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
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
      parse_json(response)
    end
  end
end
