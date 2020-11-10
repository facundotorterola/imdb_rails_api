# frozen_string_literal: true

require 'byebug'
module Secure
  def user_by_token
    # Bearer xxxxxx
    token_regex = /Bearer (.+)/
    # leer HEADER de auth
    headers = request.headers
    # verificar que sea valido
    # rubocop:disable Style/GuardClause
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      # rubocop:enable Style/GuardClause

      token = headers['Authorization'].match(token_regex)[1]
      user_token = JsonWebToken.decode(token)
      User.find(user_token[:user_id]) if user_token && User.find(user_token[:user_id])
    end
  end

  def authenticate_user!
    user = user_by_token

    if user
      Current.user = user
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def authenticate_admin!
    user = user_by_token
    if user && user[:role] == 'admin'
      Current.user = user

    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
