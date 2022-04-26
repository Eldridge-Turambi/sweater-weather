require 'rails_helper'

RSpec.describe 'Create User' do

  it 'creates user to database', :vcr do
    # headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', headers: headers, params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    user_json = JSON.parse(response.body, symbolize_names: true)

    expect(user_json).to have_key(:data)
    expect(user_json[:data]).to have_key(:type)
    expect(user_json[:data]).to have_key(:id)
    expect(user_json[:data]).to have_key(:attributes)
    expect(user_json[:data][:attributes]).to have_key(:email)
    expect(user_json[:data][:attributes]).to have_key(:api_key)
  end
end
