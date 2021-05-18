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

  describe 'movie_reviews(movie_id)' do
    it 'returns relevant movie review data' do
      search = MovieService.movie_reviews(550)
      expect(search).to be_a(Hash)
      expect(search[:results]).to be_an(Array)
        
      movie_data = search[:results].first

      expect(movie_data).to have_key(:author)
      expect(movie_data[:author]).to eq("Goddard")

      expect(movie_data).to have_key(:content)
      expect(movie_data[:content]).to eq("Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.")
    end
  end

  describe 'movie_cast(movie_id)' do
    it 'returns relevant movie cast data' do
      search = MovieService.movie_cast(550)
      expect(search).to be_a(Hash)
      expect(search[:cast]).to be_an(Array)
        
      cast_data = search[:cast].first
      
      expect(cast_data).to have_key(:name)
      expect(cast_data[:name]).to eq("Edward Norton")

      expect(cast_data).to have_key(:character)
      expect(cast_data[:character]).to eq("The Narrator")
    end
  end
end