require 'rails_helper'
RSpec.describe "Movies page" do
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it "has a list of 40 movies", :vcr do

    visit discover_path

    click_button "Find Top Rated Movies"

    expect(current_path).to eq(movies_path)
    
    within("#movie-19404") do
      expect(page).to have_link("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content('Vote Average: 8.7')
    end

    within("#movie-598") do
      expect(page).to have_link("City of God")
      expect(page).to have_content('Vote Average: 8.4')
      click_link("City of God")
      expect(current_path).to eq(movie_path(598))
    end
  end

  it "redirects unauthenticated users to root", :logged_out do
    visit movies_path
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please login")
  end

  it "has a button to show top 40 movies", :vcr do 
    visit movies_path

    click_button("Find Top Rated Movies")
    expect(current_path).to eq(movies_path)
    
    within("#movie-19404") do
      expect(page).to have_link("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content('Vote Average: 8.7')
    end

    within("#movie-598") do
      expect(page).to have_link("City of God")
      expect(page).to have_content('Vote Average: 8.4')
    end
  end

  it 'has a form to search movies by title', :vcr do
    visit movies_path

    fill_in :movie_title, with: "Fight Club"
    expect(page).to have_button('Find Movies')
    click_button 'Find Movies'
    expect(current_path).to eq(movies_path)
    expect(page).to have_link("Fight Club")
    expect(page).to have_link("Florence Fight Club")
  end

  it "has a link back to dashboard" do 
    visit movies_path
    expect(page).to have_link("Dashboard")
    click_link("Dashboard")
    expect(current_path).to eq(dashboard_path)
  end


end