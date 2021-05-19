class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.id_search_results(params[:movie_id])
  end

  def create
    # binding.pry
    party = Party.new(host_id: current_user.id, movie_id: params[:movie_id], duration: params[:duration], start_time: params[:start_time], date: params[:date])
    if party.save
      redirect_to dashboard_path
      flash[:notice] = "Viewing Party Created"
    end
  end
end