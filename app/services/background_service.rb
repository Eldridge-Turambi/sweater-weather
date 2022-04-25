class BackgroundService
  class << self


    def connection
      Faraday.new(url: 'https://api.unsplash.com/') do |faraday|
        faraday.params['client_id'] = ENV['unsplash_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_background_image(city_location)
      response = connection.get('search/photos') do |faraday|
        faraday.params['query'] = city_location
      end
      parse_json(response)
    end


  end
end
