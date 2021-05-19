class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.id_search_results(params[:movie_id])
  end

  def create
    binding.pry
    viewing_party = ViewingParty.new(duration: params[:duration], start_time: params[:start_time], when: params[:when])
    if viewing_party.save
      redirect_to dashboard_path
      flash[:notice] = "Viewing Party Created"
    end
  end
end