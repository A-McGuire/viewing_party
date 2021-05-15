require 'rails_helper'
RSpec.describe "Movies page" do
  it "has a list of 40 movies" do
    user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit movies_path
    
    within("#movie_19404") do
      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content('Vote Average: 8.7')
    end

    within("#movie_598") do
      expect(page).to have_content("City of God")
      expect(page).to have_content('Vote Average: 8.4')
    end
  end
end