require 'rails_helper'

RSpec.describe "Login form (welcome page)" do
  
  describe 'happy path' do
    it "can log in" do 
      @user = User.create!(email: "123@test.com", password: "1111")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit root_path

      within(".login-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "1111"
    
        click_button "Sign In"
      end
      
      expect(current_path).to eq(dashboard_path)
      
      expect(page).to have_content("Welcome, 123@test.com")
    end
  end
  
  describe 'sad path' do
    it "can't log in without password" do 
      visit root_path
      
      within(".login-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: ""
        
        click_button "Sign In"
      end
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Invalid Credentials")
    end

    it "can't log in with incorrect password" do 
      visit root_path

      within(".login-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "66666"
    
        click_button "Sign In"
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Invalid Credentials")
    end
  end
end