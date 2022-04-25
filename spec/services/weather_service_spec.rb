require 'rails_helper'

RSpec.describe WeatherService do
  describe 'class methods' do

    it '.coordinate_weather', :vcr do
      weather = WeatherService.coordinate_weather('san francisco,ca')
      
      expect(weather).to have_key(:current)
      expect(weather).to have_key(:daily)
      expect(weather).to have_key(:hourly)
    end
  end
end
