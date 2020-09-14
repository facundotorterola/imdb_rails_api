require 'byebug'

class ReviewController < ApplicationController 

    include Secure
    before_action :authenticate_user!,only: [:create,:update]

    # Manejo de Excepciones
    rescue_from Exception do |e|
        render json: {error: e.message}, status: 500
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
    end

   

    def create
        params[:user_id]=Current.user.id
        review = Review.create!(create_params)
        render json: review, status: :created
    end
    
    def update
        review = Review.find(params[:id])
        if review.user_id == Current.user.id
            review.update!(update_params)
            render json: review, status: :created
        else
            render json: {error: "Unauthorized"}, status: :unauthorized        
        end
    end
    
  
    def create_params
        params.permit(:title,:user_id,:movie_id,:description,:rate)
    end

    def update_params
        params.permit(:title,:description,:rate)
    end



 
    
    
    
end