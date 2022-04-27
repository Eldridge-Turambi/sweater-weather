require 'rails_helper'

RSpec.describe 'session request' do

  it 'returns proper json' do
    data = {
      'email': 'eldridge@gmail.com',
      'password': "password",
      'password_confirmation': 'password'
    }

    post '/api/v1/users', params: data
    # created_user = JSON.parse(response.body, symbolize_names: true)


    login_params = {
      'email': 'eldridge@gmail.com',
      'password': 'password'
    }

    post '/api/v1/sessions', params: login_params

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user_json = JSON.parse(response.body, symbolize_names: true)

    expect(user_json).to have_key(:data)
    expect(user_json[:data]).to have_key(:type)
    expect(user_json[:data]).to have_key(:id)
    expect(user_json[:data]).to have_key(:attributes)
    expect(user_json[:data][:attributes]).to have_key(:email)
    expect(user_json[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns json for sad path', :vcr do
    data = {
      'email': 'eldridge@gmail.com',
      'password': "password",
      'password_confirmation': 'password'
    }

    post '/api/v1/users', params: data

    login_params = {
      'email': 'eldridge@gmail.com',
      'password': 'password1'
    }

    post '/api/v1/sessions', params: login_params

    expect(response.status).to eq(400)

    user_json = JSON.parse(response.body, symbolize_names: true)
    
    expect(user_json).to be_a(Hash)
    expect(user_json[:message]).to eq('Email and/or Password invalid')
  end
end
