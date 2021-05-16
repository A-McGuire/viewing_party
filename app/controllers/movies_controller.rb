class MoviesController < ApplicationController
  def index
    @movies = Movies.top_40
  end

  def discover
  end
end
