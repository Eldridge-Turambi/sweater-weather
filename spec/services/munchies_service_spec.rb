require 'rails_helper'

RSpec.describe MunchiesService do
  describe 'class methods' do
    it '.gets_restaurant_info', :vcr do
      food_response = MunchiesService.get_restaurant_info('chinese', 'new york city,ny')

      expect(food_response).to be_a(Hash)
      expect(food_response).to have_key(:businesses)
      expect(food_response[:businesses][0]).to have_key(:name)
      expect(food_response[:businesses][0][:name]).to be_a(String)
      expect(food_response[:businesses][0][:name]).to eq("Joe's Shanghai")
    end
  end
end
