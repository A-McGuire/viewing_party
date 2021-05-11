require 'rails_helper'

RSpec.describe "Welcome Page" do
    it "has wireframe requirements" do
        visit root_path
        expect(page).to have_content("Welcome to Viewing Party")
        expect(page).to have_button("Sign In")
        expect(page).to have_link("New to Viewing Party? Register Here")
    end

    skip "redirects to new user form when link is clicked" do
        visit root_path
        click_link "New to Viewing Party? Register Here"
        expect(current_path).to eq("/register")
    end
end