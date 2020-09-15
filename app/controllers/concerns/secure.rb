require "byebug"
module Secure
  def get_user_by_token
    # Bearer xxxxxx
    token_regex = /Bearer (.+)/
    # leer HEADER de auth
    headers = request.headers
    # verificar que sea valido
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      user_token = JsonWebToken.decode(token)
      if user_token && user = User.find(user_token[:user_id])
        user
      else
        nil
      end
    else
      nil
    end 
  end

  def authenticate_user!
    user =get_user_by_token()
    
    if user
      Current.user = user
    else
      render json: {error: 'Unauthorized'}, status: :unauthorized
    end
  end

  def authenticate_admin!
    user = get_user_by_token()
    if user && user[:role]=='admin'
      Current.user =user
      
    else
      render json: {error: 'Unauthorized'}, status: :unauthorized
    end
    
  end
  
end