class RoadTripFacade
  class << self

    def road_trip_data(start_city, end_city)
      roadtrip_data = RoadTripService.road_trip_data(start_city, end_city)

      RoadTrip.new(roadtrip_data)
    end
  end
end
