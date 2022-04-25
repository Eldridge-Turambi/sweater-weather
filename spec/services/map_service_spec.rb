require 'rails_helper'

RSpec.describe MapService do
  describe 'class methods' do
    it '.find_coordinates', :vcr do
      coordinates = MapService.city_coordinates('san francisco')

      expect(coordinates).to be_a(Hash)
      expect(coordinates[:lat]).to eq(37.78008)
      expect(coordinates[:lng]).to eq(-122.420168)
    end


  end
end
