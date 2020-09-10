module Secure
    def authenticate_user!
        # Bearer xxxxxx
        token_regex = /Bearer (.+)/
        # leer HEADER de auth
        headers = request.headers
        # verificar que sea valido
        if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
          token = headers['Authorization'].match(token_regex)[1]
          user = JsonWebToken.decode(token)
          # debemos verificar que el token corresponda a un user
          if(user && Current.user = User.find(user[:user_id]))
            return
          end
        end
        render json: {error: 'Unauthorized'}, status: :unauthorized

    end
end