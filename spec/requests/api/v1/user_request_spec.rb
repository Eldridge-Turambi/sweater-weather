require 'rails_helper'

RSpec.describe 'Create User' do

  it 'creates user to database', :vcr do
    # headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    # binding.pry
    post '/api/v1/users', headers: headers, params: params

    user_json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
