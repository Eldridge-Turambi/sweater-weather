require 'rails_helper'

RSpec.describe BackgroundService do
  describe 'class methods' do
    it '.gets_background_image', :vcr do
      image_response = BackgroundService.get_background_image('san francisco')

      expect(image_response).to be_a(Hash)
      expect(image_response).to have_key(:results)
      expect(image_response[:results][0]).to have_key(:urls)
      expect(image_response[:results][0][:urls]).to have_key(:raw)
    end
  end
end
