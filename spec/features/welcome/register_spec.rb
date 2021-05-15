require 'rails_helper'

RSpec.describe "Register Form (welcome page)" do
  describe "happy path" do 
    it "can create new user after new user link is clicked" do
      visit root_path
      
      click_button "New to Viewing Party? Register Here"
      expect(current_path).to eq("/")
      within(".register-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "password123"
        fill_in :password_confirmation, with: "password123"
        click_button "Register"
      end
      expect(current_path).to eq(dashboard_path)
      
      new_user = User.last
    
      expect(page).to have_content("Welcome, 123@test.com")
      expect(new_user.email).to eq("123@test.com")
    end
  end

  describe 'sad path' do
    it "requires a password confirmation to match password" do
      visit root_path
    
      click_button "New to Viewing Party? Register Here"
    
      expect(current_path).to eq("/")
      within(".register-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "password123"
        fill_in :password_confirmation, with: "123"
        click_button "Register"
      end
      
      expect(current_path).to eq("/")
      expect(page).to have_content("Invalid credentials")
    end

    it "requires a password confirmation to match password, empty string" do
      visit root_path
    
      click_button "New to Viewing Party? Register Here"
    
      expect(current_path).to eq("/")
      within(".register-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "password"
        fill_in :password_confirmation, with: ""
        
        click_button "Register"
      end
      
      expect(current_path).to eq("/")
      expect(page).to have_content("Invalid credentials")
    end

    it "requires a password" do
      visit root_path
    
      click_button "New to Viewing Party? Register Here"
    
      expect(current_path).to eq("/")
    
      within(".register-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: ""
        fill_in :password_confirmation, with: ""
        click_button "Register"
      end
      
      expect(current_path).to eq("/")
      expect(page).to have_content("Invalid credentials")
    end
  end
end