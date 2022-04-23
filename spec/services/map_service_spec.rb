require 'rails_helper'

RSpec.describe MapService do
  describe 'class methods' do
    it '.find_coordinates', :vcr do
      coordinates = MapService.city_coordinates('san francisco')
      expect(coordinates).to be_a(Hash)
    end
  end
end
