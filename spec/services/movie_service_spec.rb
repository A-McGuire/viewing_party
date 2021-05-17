require 'rails_helper'

RSpec.describe 'Movie Services', :vcr do
  describe 'movie(id)' do
    it 'returns movie data for one movie' do
      movie_data = MovieService.movie(238)
      
      expect(movie_data).to be_a(Hash)
      

      expect(movie_data).to have_key(:title)
      expect(movie_data[:title]).to be_a(String)

      expect(movie_data).to have_key(:id)
      expect(movie_data[:id]).to be_an(Integer)

      expect(movie_data).to have_key(:vote_average)
      expect(movie_data[:vote_average]).to be_a(Float)
    end
  end

  describe 'top_rated_movies(page_number)' do
    it 'returns top rated movie data' do
      search = MovieService.top_rated_movies(1)
        
      expect(search).to be_a(Hash)
      expect(search[:results]).to be_an(Array)
        
      movie_data = search[:results].first

      expect(movie_data).to have_key(:title)
      expect(movie_data[:title]).to be_a(String)

      expect(movie_data).to have_key(:id)
      expect(movie_data[:id]).to be_an(Integer)

      expect(movie_data).to have_key(:vote_average)
      expect(movie_data[:vote_average]).to be_a(Float)
    end
  end

  describe 'title_search(movie_title)' do
    it 'returns relevant movie data' do
      search = MovieService.title_search("Shrek")
        
      expect(search).to be_a(Hash)
      expect(search[:results]).to be_an(Array)
        
      movie_data = search[:results].first

      expect(movie_data).to have_key(:title)
      expect(movie_data[:title]).to eq("Shrek")

      expect(movie_data).to have_key(:id)
      expect(movie_data[:id]).to eq(808)

      expect(movie_data).to have_key(:vote_average)
      expect(movie_data[:vote_average]).to eq(7.7)
    end
  end
end