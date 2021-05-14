class WelcomeController < ApplicationController
  def index
    movie = MovieService.movie
    binding.pry
  end
end
