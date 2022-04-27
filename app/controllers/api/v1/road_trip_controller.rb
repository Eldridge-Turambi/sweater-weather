class Api::V1::RoadTripController < ApplicationController

  def create
    start_location = params[:origin]
    end_location = params[:destination]

    user = User.find_by(api_key: params[:api_key])
    trip_service = RoadTripService.road_trip_data(start_location, end_location)

    if user.present?
      unless (trip_service[:info][:statuscode] == 402)
        roadtrip = RoadTripFacade.road_trip_data(start_location, end_location)
        render json: RoadTripSerializer.make_road_trip(start_location, end_location, roadtrip), status: 201
      else
        render json: {message: 'ooops Unable to find routes for these locations' }, status: 400
      end
    elsif user.present? == false
      render json: {message: "Bad API key" }, status: 400
    end
  end
end
