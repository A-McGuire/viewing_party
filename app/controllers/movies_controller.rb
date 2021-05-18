class MoviesController < ApplicationController
  def index
    if params[:movie_title].present?
      @movies = MovieFacade.title_search_results(params[:movie_title])
    elsif params[:display] == 'top40'
      @movies = MovieFacade.top40
    end
  end

  def show
    @reviews = MovieService.movie_reviews(params[:id])
    @movie = MovieService.movie(params[:id])
    @cast = MovieService.movie_cast(params[:id])
  end
end
