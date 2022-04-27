require 'rails_helper'

RSpec.describe 'road trip request' do

  it 'responds json for road trip when given API key', :vcr do
    user = User.create(email: 'randomperson@gmail.com', password: 'qwerty', password_confirmation: 'qwerty')

    params = {
      'origin': 'Denver,CO',
      'destination': 'Parker,CO',
      'api_key': user.api_key
    }

    post '/api/v1/road_trip', params: params

    expect(response).to be_successful
    expect(response.status).to eq(201)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip).to be_a(Hash)
    expect(road_trip).to have_key(:data)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data]).to have_key(:attributes)
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it 'sad path for road trip request', :vcr do
    user = User.create(email: 'randomperson@gmail.com', password: 'qwerty', password_confirmation: 'qwerty')

    params = {
      'origin': 'Denver,CO',
      'destination': 'London,UK',
      'api_key': user.api_key
    }

    post '/api/v1/road_trip', params: params

    expect(response.status).to eq(400)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip).to be_a(Hash)
    expect(road_trip[:message]).to eq('ooops Unable to find routes for these locations')
  end
end
