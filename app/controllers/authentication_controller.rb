
require 'bcrypt'

class AuthenticationController < ApplicationController 
    include BCrypt

    def login
        user = User.find_by_email(params[:email])
        password = Password.new(user.password)
        if password.eql?(user.password)
            token = JsonWebToken.encode(user_id: user.id)

            render json: {user: user,token: token}, status: :ok
        else
            render json: {not_ok: params,user: user.password,password: password}, status: :ok

        end
    end
    
end
