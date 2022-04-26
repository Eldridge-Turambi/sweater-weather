class RoadTripSerializer
  class << self
    def make_road_trip(start_city, end_city, roadtrip)
      {
        'data': {
          'id': nil,
          'type': 'roadtrip',
          'attributes': {
            'start_city': start_city,
            'end_city': end_city,
            'travel_time': roadtrip.travel_time,
            'weather_at_eta': {
              'temperature': roadtrip.temp,
              'conditions': roadtrip.conditions
            }
          }
        }
      }
    end

  end
end
