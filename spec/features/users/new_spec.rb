require 'rails_helper'

RSpec.describe 'New User Registration' do 

    it "can create a new user and save that user to the database" do 
        visit root_path

        click_link "New to Viewing Party? Register Here"

        expect(current_path).to eq("/register")

        fill_in "user[email]", with: "123@test.com"
        fill_in "user[password]", with: "password123"

        click_button "Register"

        expect(current_path).to eq(dashboard_path)
        new_user = User.last

        expect(page).to have_content("Welcome, 123@test.com!")
        expect(new_user.email).to eq('123@test.com')
    end 
end 