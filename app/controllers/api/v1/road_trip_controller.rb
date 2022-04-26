class Api::V1::RoadTripController < ApplicationController

  def create
    start_location = params[:origin]
    end_location = params[:destination]

    render json: RoadTripSerializer.make_road_trip(start_location, end_location, roadtrip), status: 201
  end

end
