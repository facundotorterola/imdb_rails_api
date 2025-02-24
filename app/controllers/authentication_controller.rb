
require 'bcrypt'

class AuthenticationController < ApplicationController 
    include BCrypt

    def login
        if user = User.find_by_email(params[:email])
            password = Password.new(user.password)
            if password==params[:password]
                token = JsonWebToken.encode(user_id: user.id)
                render json: {token: token}, status: :ok
            else
                render json: {error: "Email or password invalid"}, status: :unauthorized

            end
        else
            render json: {error: "Email or password invalid"}, status: :unauthorized
        end
    end
    
end
