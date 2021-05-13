require 'rails_helper'

RSpec.describe "Welcome Page" do
  it "has wireframe requirements" do
    visit root_path
    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_button("Sign In")
    expect(page).to have_link("New to Viewing Party? Register Here")
  end

  it "redirects to new user form when link is clicked" do
    visit root_path
    click_link "New to Viewing Party? Register Here"
    expect(current_path).to eq("/register")
  end

  skip "redirects to user dashboard when sign in button is clicked" do
    visit root_path
    click_link "Sign In"
    expect(current_path).to eq("/dashboard")
  end

  describe 'log in' do
    describe 'happy path' do
      it "can log in" do 
        user = User.create!(email: "123@test.com", password: "password123")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
        visit root_path
    
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "password123"
    
        click_button "Sign In"
    
        expect(current_path).to eq(dashboard_path)
    
        expect(page).to have_content("Welcome, 123@test.com")
      end
    end
  end
end