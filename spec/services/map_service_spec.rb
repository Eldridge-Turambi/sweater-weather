require 'rails_helper'

RSpec.describe MapService do
  describe 'class methods' do
    it '.find_coordinates', :vcr do
      coordinates = MapService.city_coordinates('san francisco')
      
      expect(coordinates).to be_a(Hash)
      expect(coordinates[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(coordinates[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(coordinates[:results][0][:locations][0][:latLng]).to have_key(:lng)
      expect(coordinates[:results][0][:locations][0][:latLng][:lat]).to eq(37.78008)
      expect(coordinates[:results][0][:locations][0][:latLng][:lng]).to eq(-122.420168)
    end
  end
end
