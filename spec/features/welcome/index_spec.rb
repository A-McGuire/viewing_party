require 'rails_helper'
RSpec.describe "Welcome Page" do
  before :each do
    visit root_path
  end

  it "has a welcome message" do
    expect(page).to have_content("Welcome to Viewing Party")
  end

  it "has a description of the app" do
    expect(page).to have_content("Viewing party is an app that allows you to search movies and create viewing parties with your friends.")
  end

  it "has a button to register" do
    expect(page).to have_button("New to Viewing Party? Register Here")
  end

  it "has an email and password form to log in" do
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button("Sign In")
  end
end