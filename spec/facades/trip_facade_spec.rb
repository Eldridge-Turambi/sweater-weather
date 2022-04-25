require 'rails_helper'

RSpec.describe 'TripTime Facade' do
  describe 'class methods' do

    xit 'makes Triptime poros', :vcr do
      trip_time = TripFacade.directions_and_time('denver,co', 'san francisco,ca')
      expect(trip_time).to be_an_instance_of(Trip)
    end
  end
end
