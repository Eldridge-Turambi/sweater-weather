class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.user_response(user), status: 201
    else
      render json: { data: { message: 'Invalid Email or Password'}}
    end
  end

end
