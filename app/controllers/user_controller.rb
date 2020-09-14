require 'byebug'

class UserController < ApplicationController 

    # Manejo de Excepciones
    rescue_from Exception do |e|
        render json: {error: e.message}, status: 500
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
    end

    def index
        users=User.paginate(page:params[:page],per_page: 10)
        render json:users, status: :ok
    end

    def show
        user=User.find(params[:id])
        render json:user, status: :ok
    end

    def create
        user = User.create!(create_params)
        render json:user, status: :created
    end
    

    def update
        user=User.find(params[:id])
        user.update!(update_params)
        render json:user, status: :ok
    end
    

    def create_params
        params.require(:user).permit(:first_name,:last_name,:email,:bio,:password)
    end

    def update_params
        params.require(:user).permit(:first_name,:last_name,:bio)
    end
    
    
end