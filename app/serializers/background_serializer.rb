class BackgroundSerializer
  class << self

    def image(data, location)
      {
        'data': {
          'type': 'image',
          'id': nil,
          'attributes': {
            'image': {
              'location': location,
              'image_url': data[:results][0][:urls][:raw],
              'credit': {
                'source': 'unsplash.com',
                'author': data[:results][0][:user][:username],
                'logo': data[:results][0][:user][:profile_image][:small]
              }
            }
          }
        }
      }
    end
  end
end
