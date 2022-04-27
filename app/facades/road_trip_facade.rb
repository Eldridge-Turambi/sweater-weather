class RoadTripFacade
  class << self

    def road_trip_data(start_city, end_city)
      roadtrip_data = RoadTripService.road_trip_data(start_city, end_city)
      end_city_weather = WeatherService.coordinate_weather(end_city)[:hourly]
      RoadTrip.new(roadtrip_data, end_city_weather)
    end
  end
end
