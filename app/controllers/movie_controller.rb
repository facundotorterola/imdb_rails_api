require 'byebug'

class MovieController < ApplicationController 

    include Secure
    before_action :authenticate_admin!,only: [:create,:update]

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
            last_page =(movies.length > 10) ? (movies.length/10.0).ceil : nil
        else
            movies =Movie.paginate(page:params[:page],per_page: 10)
            movies_length= Movie.count()
            last_page = (movies_length) > 10 ? (movies_length/10.0).ceil : nil
        end
        response={
            movies: movies,
            last_page:last_page
        }
        success_response("",response,:ok)
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