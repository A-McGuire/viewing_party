require 'rails_helper'

RSpec.describe "Discover page" do
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end

    it "redirects unauthenticated users to root", :logged_out do
    visit '/discover'
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please login")
  end
end