class MoviesController < ApplicationController
  def index
    if params[:movie_title].present?
      @movies = MovieFacade.title_search_results(params[:movie_title])
    elsif params[:display] == 'top40'
      @movies = MovieFacade.top40
    end
  end

  def show
    @movie = MovieFacade.id_search_results(params[:id])
    @reviews = MovieFacade.reviews_search_results(params[:id])
    @cast = MovieFacade.cast_search_results(params[:id])
  end
end
