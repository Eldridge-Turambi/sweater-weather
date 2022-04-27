class Api::V1::SessionsController < ApplicationController

  def create
    # user = User.find_by(email: params[:email])
    # if user.authenticate(params[:password])
    #   render json: UserSerializer.user_response(user), status: 201
    # else
    #   render json: { data: { message: 'Invalid Email or Password'}}
    # end

    user = User.find_by(email: params[:email])

    if user.present?
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: UserSerializer.user_response(user), status: 201
      else
        render json: {message: "Email and/or Password invalid" }, status: 400
      end
    else
      render json: {message: "Email and/or Password invalid" }, status: 400
    end
  end

end
