class MunchiesSerializer
  class << self

    def food_travel_weather(city, food, directions, forecast)
      {
        'data': {
          'id': nil,
          'type': 'munchie',
          'attributes': {
            'destination_city': city,
            'travel_time': "#{(directions[:route][:legs][0][:time]/60)/60} hours and #{(directions[:route][:legs][0][:time]/60)%60}min ",
            'forecast': {
              'summary': forecast[:current][:weather][0][:description],
              'temperature': forecast[:current][:temp]
            },
            'restaurant': {
              'name': food[:businesses][0][:name],
              'address': "#{food[:businesses][0][:location][:address1]}, #{food[:businesses][0][:location][:city]}, #{food[:businesses][0][:location][:state]}, #{food[:businesses][0][:location][:zip_code]}"
            }
          }
        }
      }
    end

  end
end
