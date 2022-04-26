class UserSerializer
  class << self

    def user_response(user)
      {
        'data': {
          'type': 'users',
          'id': user.id,
          'attributes': {
            'email': user.email,
            'api_key': user.api_key
          }
        }
      }
    end
  end
end
