require 'rails_helper'

RSpec.describe 'User Dashboard' do 
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
    expect(current_path).to eq(discover_index_path)
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

      visit discover_index_path
      expect(current_path).to eq(root_path)
    end
  end

  describe 'friends section' do
    it "has a friends section" do
      visit dashboard_path
      within("#friends-section") do
        expect(page).to have_content("Friends")
      end
    end

    it 'has a form to add a friend' do
      friend = User.create!(email: "friend@email.com", password: "1111")
      visit dashboard_path
      within("#friends-section") do
        within("#add-friend-form") do
          fill_in :email, with: "friend@email.com"
          click_button "Add Friend"

          expect(current_path).to eq(dashboard_path)
        end
        expect(page).to have_content('friend@email.com')
      end
    end

    it 'if user has no friends, no friends are displayed' do
      visit dashboard_path
      within("#friends-section") do
        expect(page).to have_content("You currently have no friends")
      end
    end

    describe "sad path" do
      it "shows an error message if the email does not exist in the database" do
        visit dashboard_path
        within("#friends-section") do
          within("#add-friend-form") do
            fill_in :email, with: "friend@email.com"
            click_button "Add Friend"

            expect(current_path).to eq(dashboard_path)
          end
        end
        expect(page).to have_content('User not found')
      end
    end
  end
  
  describe 'viewing party section' do
    it "has a viewing party section" do
      party = Party.create!(host_id: @user.id, movie_id: 550, duration: 139, date: "06/02/2021", start_time: 3:00)
      visit dashboard_path
      
      within("#party-section") do
        expect(page).to have_content("Viewing Parties")
      end
    end
  end
end