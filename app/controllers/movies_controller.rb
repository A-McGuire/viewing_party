class MoviesController < ApplicationController
  def index
    @movies = Movies.top40
    return unless params[:movie_title].present?

    @title_search = Movies.title_search_results(params[:movie_title])
  end

  def discover; end
end
