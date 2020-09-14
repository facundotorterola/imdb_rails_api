require 'byebug'

class MovieController < ApplicationController 

    include Secure
    before_action :authenticate_user!,only: [:create_review]

    # Manejo de Excepciones
    rescue_from Exception do |e|
        render json: {error: e.message}, status: 500
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
    end

    def index
        if params[:search] &&  params[:search].present?
            movies=Movie.all
            movies = MovieSearchService.search(movies,params[:search])    
        else
            movies =Movie.paginate(page:params[:page],per_page: 10)
        end

        render json:movies.includes(:reviews), status: :ok
    end

    def show
        movie=Movie.find(params[:id])
        render json:movie, status: :ok
    end

    def create
        movie = Movie.create!(create_params)
        render json:movie, status: :created
    end
    

    def update
        movie=Movie.find(params[:id])
        movie.update!(update_params)
        render json:movie, status: :ok
    end

    
    def create_params
        params.require(:movie).permit(:title,:director,:year,:description)
    end

    def update_params
        params.require(:movie).permit(:title,:director,:year,:description)
    end


 
    
    
    
end