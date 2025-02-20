require 'rails_helper'

RSpec.describe "Discover page" do
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it "redirects unauthenticated users to root", :logged_out do

    visit discover_index_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please login")
  end

  it 'has a link to top 40 movies (/movies)', :vcr do

    visit discover_index_path

    expect(page).to have_button('Find Top Rated Movies')
    click_button 'Find Top Rated Movies'
    expect(current_path).to eq(movies_path)
  end

  it 'has a form to search movies by title', :vcr do

    visit discover_index_path

    fill_in :movie_title, with: "Fight Club"
    expect(page).to have_button('Find Movies')
    click_button 'Find Movies'
    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Fight Club")
    expect(page).to have_content("Florence Fight Club")
  end

  it "has a link back to dashboard" do 

    visit discover_index_path

    expect(page).to have_link("Dashboard")
    click_link('Dashboard')
    expect(current_path).to eq(dashboard_path)
  end
end