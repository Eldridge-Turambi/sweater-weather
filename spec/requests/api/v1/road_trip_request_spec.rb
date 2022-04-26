require 'rails_helper'

RSpec.describe 'road trip request' do

  xit 'responds json for road trip when given API key', :vcr do
    user = User.create(email: 'randomperson@gmail.com', password: 'qwerty', password_confirmation: 'qwerty')

    params = {
      'origin': 'Denver,CO',
      'destination': 'Parker,CO',
      'api_key': user.api_key
    }


    post '/api/v1/road_trip', params: params

    expect(response).to be_successful
    expect(response.status).to eq(204)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip).to be_a(Hash)

  end
end
