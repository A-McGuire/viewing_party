class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.id_search_results(params[:movie_id])
  end
end