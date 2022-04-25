class ForecastSerializer
  class << self

    def weather(forecast)
      {
        'data': {
          'id': nil,
          'type': 'forecast',
          'attributes': {
            'current_weather': {
              'datetime': Time.at(forecast[:current][:dt]).strftime('%H:%M'),
              'temperature': forecast[:current][:temp],
              'sunrise': Time.at(forecast[:current][:sunrise]).strftime('%H:%M'),
              'sunset': Time.at(forecast[:current][:sunset]).strftime('%H:%M'),
              'feels_like': forecast[:current][:feels_like],
              'humidity': forecast[:current][:humidity],
              'uvi': forecast[:current][:uvi],
              'visibility': forecast[:current][:visibility],
              'condition': forecast[:current][:weather][0][:description],
              'icon': forecast[:current][:weather][0][:icon]
            },
            'daily_weather': forecast[:daily].shift(5).map do |day|
              {
                'date': Time.at(day[:dt]).strftime('%F'),
                'sunrise': Time.at(day[:sunrise]).strftime('%H:%M'),
                'sunset': Time.at(day[:sunset]).strftime('%H:%M'),
                'max_temp': day[:temp][:max],
                'min_temp': day[:temp][:min],
                'conditions': day[:weather][0][:description],
                'icon': day[:weather][0][:icon]
              }
            end,
            'hourly_weather': forecast[:hourly].shift(8).map do |hour|
              {
                'time': Time.at(hour[:dt]).strftime('%H:%M'),
                'temp': hour[:temp],
                'condition': hour[:weather][0][:description],
                'icon': hour[:weather][0][:icon]
              }
            end
          }
        }
      }
    end
  end
end
