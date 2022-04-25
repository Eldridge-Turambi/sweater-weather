require 'rails_helper'

RSpec.describe 'munchies request' do
  it 'returns munchies json', :vcr do
    # headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    params = {
      'start': 'denver,co',
      'destination': 'san francisco,ca',
      'food': 'chinese'
    }

    get '/api/v1/munchies', params: params

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a(Hash)

    expect(json).to have_key(:data)

    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)

    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('munchie')
    expect(json[:data][:attributes].keys).to include(:destination_city, :travel_time, :forecast, :restaurant)

    expect(json[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(json[:data][:attributes][:restaurant]).to have_key(:name)
    expect(json[:data][:attributes][:restaurant]).to have_key(:address)
  end
end
