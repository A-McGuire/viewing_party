class MoviesController < ApplicationController
  def index
    @movies = Movies.top40
    return unless params[:movie_title].present?

    title_search = MovieService.title_search(params[:movie_title].gsub(' ', '+'))
    @title_search = title_search[:results]
  end

  def discover; end
end
