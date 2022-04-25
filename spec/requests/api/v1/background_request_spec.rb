require 'rails_helper'

RSpec.describe 'background request' do

  it 'sends json for background', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    background_params = { location: 'san francisco,ca'}

    get '/api/v1/backgrounds', headers: headers, params: background_params
    expect(response).to be_successful
    expect(response.status).to eq(200)
    background = JSON.parse(response.body, symbolize_names: true)
    expect(background).to have_key(:data)
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to have_key(:image)
    expect(background[:data][:attributes][:image]).to have_key(:location)
    expect(background[:data][:attributes][:image]).to have_key(:image_url)
    expect(background[:data][:attributes][:image]).to have_key(:credit)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:logo)
  end
end
