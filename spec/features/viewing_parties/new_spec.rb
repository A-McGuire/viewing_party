require 'rails_helper'

RSpec.describe 'New viewing party', :vcr do
  before :each do |test|
    @user = User.create!(email: "123@email.com", password: "1111")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user) unless test.metadata[:logged_out]
  end
  describe 'happy path' do
    it 'can create a viewing party' do
      friend = User.create!(email: "friend@email.com", password: "1111")
      friendship = Friendship.create!(user_id: @user.id, friend_id: friend.id)

      visit discover_index_path
      click_button("Find Top Rated Movies")
      click_link("Fight Club")
      expect(current_path).to eq(movie_path(550))

      click_link("Create Viewing Party")
      expect(current_path).to eq(new_viewing_party_path)
      expect(page).to have_content("Fight Club")
      expect(find_field(:duration).value).to eq('139')
      fill_in :when, with: '5/19/21'
      fill_in :start_time, with: '1:00'
      expect(page).to have_content("friend@email.com")

    end
  end
end