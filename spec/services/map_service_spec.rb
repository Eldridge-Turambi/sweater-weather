require 'rails_helper'

RSpec.describe MapService do
  describe 'class methods' do
    it '.find_coordinates', :vcr do
      coordinates = MapService.city_coordinates('san francisco')

      expect(coordinates).to be_a(Hash)
      expect(coordinates[:lat]).to eq(37.78008)
      expect(coordinates[:lng]).to eq(-122.420168)
    end

    it '.directions_and_time', :vcr do
      directions_info = MapService.directions_and_time('denver,co', 'san francisco,ca')
      expect(directions_info).to be_a(Hash)
      expect(directions_info).to have_key(:route)

      ## below integer is in seconds
      expect(directions_info[:route][:legs][0][:time]).to be_an(Integer)
    end
  end
end
