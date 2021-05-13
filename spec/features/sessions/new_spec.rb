require 'rails_helper'

RSpec.describe 'Log in' do 
  describe 'happy paths' do
    it "can log in" do 
      user = User.create!(email: "123@test.com", password: "password123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
  
      click_link "Sign In"
  
      expect(current_path).to eq("/login")
  
      fill_in :email, with: "123@test.com"
      fill_in :password, with: "password123"
  
      click_button "Sign In"
  
      expect(current_path).to eq(dashboard_path)
  
      expect(page).to have_content("Welcome, 123@test.com")
    end
  end
  
  describe 'sad path' do
    it "redirects from dashboard to welcome page if not signed in" do 
      user = User.create!(email: "123@test.com", password: "password123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
      visit dashboard_path
      expect(current_path).to eq(root_path)
    end
  end
end