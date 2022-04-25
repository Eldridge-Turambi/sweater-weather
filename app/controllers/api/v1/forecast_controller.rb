class Api::V1::ForecastController < ApplicationController

  def index
    if params[:location].present?
      forecast = WeatherService.coordinate_weather(params[:location])
      render json: ForecastSerializer.weather(forecast)
    else
      render status: 404
    end
  end
end
