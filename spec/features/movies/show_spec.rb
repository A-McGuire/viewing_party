require 'rails_helper'
RSpec.describe "Movie show page", :vcr  do
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it "shows a movie's details"do 
    visit discover_index_path
    click_button("Find Top Rated Movies")
    click_link("Fight Club")
    overview = "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."
    expect(current_path).to eq(movie_path(550))

    within("#movie-attributes") do
      expect(page).to have_content("Fight Club")
      expect(page).to have_content(8.4)
      expect(page).to have_content("2 Hours 19 Minutes")
      expect(page).to have_content("Drama")
      expect(page).to have_content(overview)
    end

    within("#movie-cast") do
      expect(page).to have_content("Edward Norton")
      expect(page).to have_content("The Narrator")
      expect(page).to have_content("Brad Pitt")
      expect(page).to have_content("Tyler Durden")
    end

    within("#movie-reviews") do
      expect(page).to have_content("5 Reviews")
      
      within("#review-Goddard") do
        expect(page).to have_content("Goddard")
        expect(page).to have_content("Pretty awesome movie. It shows what one crazy person can convince other crazy people to do. Everyone needs something to believe in. I recommend Jesus Christ, but they want Tyler Durden.")
      end

      within("#review-rsanek") do
        expect(page).to have_content("rsanek")
        expect(page).to have_content("I was mostly neutral on this movie until the last third, when things turned psychologically thrilling and gave me American Psycho vibes. The \"His name was Robert Paulson\" scene specifically was where the film turned from 3 starts to 4.5 stars. Would recommend and I intend to return to this in some time as I feel it has higher rewatchability than many films of this style.")
      end
    end
  end

  it "has a link to create a viewing party" do
    visit discover_index_path
    click_button("Find Top Rated Movies")
    click_link("Fight Club")
    expect(current_path).to eq(movie_path(550))

    expect(page).to have_link("Create Viewing Party")
    click_link("Create Viewing Party")
    expect(current_path).to eq("/viewing_party/new")
  end
end