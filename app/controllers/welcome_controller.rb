class WelcomeController < ApplicationController
  def index
    top = MovieService.movie
    binding.pry
  end
end
