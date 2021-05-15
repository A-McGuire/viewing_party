class MoviesController < ApplicationController
  def index
    @movies1 = MovieService.top_rated_movies(1)
    @movies2 = MovieService.top_rated_movies(2)
  end
end