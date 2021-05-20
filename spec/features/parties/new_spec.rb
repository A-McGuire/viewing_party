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
      expect(current_path).to eq(new_party_path)
      expect(page).to have_content("Fight Club")
      expect(find_field(:duration).value).to eq('139')
      fill_in :date, with: Time.new(2021, 06, 02)
      # fill_in :start_time, with: Time.now
      expect(page).to have_content("Friend@email.com")
      check :invite
      click_button("Create Party")
      party = Party.last
      expect(party.duration).to eq(139)
      expect(party.date.to_s).to eq("2021-06-02")
      # expect(party.start_time).to eq(Time.now)
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Viewing Party Created")

      # within '#party-section' do
      #   within '#hosting-section' do
      #     expect(page).to have_content("Fight Club")
        # end
      # end
    end
  end
end