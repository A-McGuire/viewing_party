class WelcomeController < ApplicationController
  def index
    movie = MovieService.movie(555)
    binding.pry
  end
end
