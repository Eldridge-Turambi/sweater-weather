class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      render json: UserSerializer.user_response(user)
    else
      render status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end

end
