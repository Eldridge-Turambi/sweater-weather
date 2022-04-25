class Api::V1::BackgroundsController < ApplicationController

  def index
    data = BackgroundService.get_background_image(params[:location])

    render json: BackgroundSerializer.image(data, params[:location])
  end
end
