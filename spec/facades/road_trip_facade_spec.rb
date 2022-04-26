require 'rails_helper'

RSpec.describe RoadTripFacade do

  describe 'class methods' do
    it 'makes roadtrip facades', :vcr do
      roadtrip = RoadTripFacade.road_trip_data('denver,co', 'pueblo,co')
      expect(roadtrip).to be_a(RoadTrip)
    end
  end
end
