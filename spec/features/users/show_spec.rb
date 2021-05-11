require 'rails_helper'

RSpec.describe 'User Dashboard' do 
    before :each do 
        visit "/register"
        fill_in "user[email]", with: "123@test.com"
        fill_in "user[password]", with: "password123"

        click_button "Register"
    end

    it "I see my email displayed in a welcome message" do 
        expect(page).to have_content("Welcome, 123@test.com")
    end


end