require 'rails_helper'
RSpec.describe "Welcome Page" do
  it "has wireframe requirements" do
    visit root_path
    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_button("New to Viewing Party? Register Here")
  end
end