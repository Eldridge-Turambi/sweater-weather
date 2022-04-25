require 'rails_helper'

RSpec.describe 'forecast request' do
  it 'returns forecast json', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    city_params = { 'location': 'denver,co' }

    get '/api/v1/forecast', headers: headers, params: city_params

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
  end
end
