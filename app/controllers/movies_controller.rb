class MoviesController < ApplicationController
  def index
    if params[:movie_title].present?
      @movies = Movies.title_search_results(params[:movie_title])
    elsif params[:display] == 'top40'
      @movies = Movies.top40
    end
  end

  def discover; end
end
