# frozen_string_literal: true

require 'byebug'
class MovieSearchService
  def self.search(movies, query)
    # Ahora lo haremos por cache
    # Una cache funciona como un db clave valor
    # Fetch es para agregar algo a la cache
    movies_ids = Rails.cache.fetch("movie_search/#{query}", expires_in: 1.hours) do
      movies.where("title like '%#{query}%' OR director like '%#{query}%' ").map(&:id)
    end

    movies.where(id: movies_ids)
    # ANTES :Esto es una query a la bd a la tabla posts
    # posts.where("title like '%#{query}%'")
  end
end
