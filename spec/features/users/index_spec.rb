require 'rails_helper'

RSpec.describe 'User Dashboard' do \
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

  it "I see my email displayed in a welcome message" do 

    visit dashboard_path
    
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome, 123@email.com")
  end
  
  it "redirects unauthenticated users to root", :logged_out do
    visit dashboard_path
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please login")
  end
  
  it 'has a button to discover movies' do
    visit dashboard_path

    expect(page).to have_button("Discover Movies")
    click_button "Discover Movies"
    expect(current_path).to eq(discover_path)
  end

  describe 'log out', :logged_out do

    it 'can log out and after log out user can not access restricted pages' do
      visit root_path

      click_button "New to Viewing Party? Register Here"

      expect(current_path).to eq(root_path)

      within(".register-form") do
        fill_in :email, with: "123@test.com"
        fill_in :password, with: "password123"
        fill_in :password_confirmation, with: "password123"
        click_button "Register"
      end

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_link("Log Out")
      click_link "Log Out"
      
      expect(current_path).to eq(root_path)

      visit dashboard_path
      expect(current_path).to eq(root_path)

      visit movies_path
      expect(current_path).to eq(root_path)

      visit discover_path
      expect(current_path).to eq(root_path)
    end
  end

  describe 'friends section' do

  end
  
  describe 'viewing party section' do

  end

end