require 'rails_helper'

RSpec.describe 'User Dashboard' do 
  it "I see my email displayed in a welcome message" do 
    user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome, 123@email.com")
  end
  
  it "redirects unauthenticated users to root" do
    visit '/dashboard'
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please login")
  end
end