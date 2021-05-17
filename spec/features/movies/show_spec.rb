require 'rails_helper'
RSpec.describe "Movie show page" do
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it "shows a movie's details", :vcr do 
    visit discover_path
    click_button("Find Top Rated Movies")
    click_link("City of God")
    expect(current_path).to eq(movie_path(598))


    #from get details query using movie id (/movie/movie_id)
      # expect(page).to have_content(movie.title)
      # expect(page).to have_content(movie.vote_average)
      # expect(page).to have_content(movie.runtime)
      # expect(page).to have_content(movie.genres[:name])
      # expect(page).to have_content(movie.overview)
      # expect(page).to have_content(movie.vote_count)

    #from get credits query (/movie/movie_id/credits)
      # expect(page).to have_content(movie.cast.name) -- limit to 10

    #from get reviews query (/movie/movie_id/reviews)
      # expect(page).to have_content(movie.results.author)
      # expect(page).to have_content(movie.reviews.content)

    
  end

  
end