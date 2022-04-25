class Api::V1::MunchiesController < ApplicationController

  def index
    munchies_data = MunchiesService.get_restaurant_info(params[:food], params[:destination])
    directions_data = MapService.directions_and_time(params[:start], params[:destination])
    forecast_data = WeatherService.coordinate_weather(params[:destination])
  

    render json: MunchiesSerializer.food_travel_weather(params[:destination], munchies_data, directions_data, forecast_data)
  end
end
