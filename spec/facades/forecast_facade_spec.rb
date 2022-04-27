require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'making poros' do
    it 'makes forecast poros for current weather', :vcr do
      response = ForecastFacade.current_weather('denver,co')

      expect(response).to be_an_instance_of(CurrentWeather)
    end

    it 'is able to make daily weather poro', :vcr do
      response = ForecastFacade.daily_weather('denver,co')

      expect(response).to be_a(DailyWeather)
    end

    it 'is able to make hourly weather poro', :vcr do
      response = ForecastFacade.hourly_weather('denver,co')
      expect(response).to be_a(HourlyWeather)
    end

  end
end
