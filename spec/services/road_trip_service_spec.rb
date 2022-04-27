require 'rails_helper'

RSpec.describe RoadTripService do

  describe 'class methods' do

    it 'returns faraday response', :vcr do
      roadtrip = RoadTripService.road_trip_data('denver,co', 'pueblo,co')

      expect(roadtrip).to be_a(Hash)
    end
  end
end
