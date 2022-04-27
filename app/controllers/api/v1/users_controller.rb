class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if params[:password] != params[:password_confirmation]
      render json: { status: 400, message: "Passwords Do Not Match" }
    elsif User.find_by(email: user[:email]).present?
      render json: { status: 400, message: "Email already exists" }
    else
      user.save
      render json: UserSerializer.user_response(user)
    end
  end


  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
