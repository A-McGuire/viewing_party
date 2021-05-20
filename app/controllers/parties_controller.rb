class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.id_search_results(params[:movie_id])
  end

  def create
    party = Party.new(host_id: current_user.id, movie_id: params[:movie_id], duration: params[:duration],
                      date: params[:date], start_time: params[:start_time])
    if party.save
      redirect_to dashboard_path
      flash[:notice] = 'Viewing Party Created'
    end
  end
end
