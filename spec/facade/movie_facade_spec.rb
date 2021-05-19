require 'rails_helper'

RSpec.describe 'Movie Facade', :vcr do
  describe 'top40' do
    it 'returns 40 movies' do
      top_movies = MovieFacade.top40

      expect(top_movies.count).to eq(40)
    end
  end

  describe 'title_search_results' do
    it 'returns an array of movies related to the search' do
      search_movies = MovieFacade.title_search_results("Fight Club")

      expect(search_movies.class).to eq(Array)
      expect(search_movies.first.title).to eq("Fight Club")
    end
  end

  describe 'id_search_results' do
    it 'returns the movie' do
      search_results = MovieFacade.id_search_results(278)
      expect(search_results.class).to eq(MovieShow)
      expect(search_results.title).to eq("The Shawshank Redemption")
      expect(search_results.vote_average).to eq(8.7)
      expect(search_results.runtime).to eq(142)
      expect(search_results.overview).to eq("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
      expect(search_results.genres.class).to eq(Array)
    end
  end

  describe 'reviews_search_results' do
    it 'returns the movie reviews' do
      search_results = MovieFacade.reviews_search_results(278)
      expect(search_results.class).to eq(MovieReviews)
      expect(search_results.total_results).to eq(6)
      expect(search_results.authors.class).to eq(Hash)
      expect(search_results.authors.first.first).to eq("elshaarawy")
    end
  end

  describe 'cast_search_results' do
    it 'returns the first 10 movie cast members' do
      search_results = MovieFacade.cast_search_results(278)
      expect(search_results.class).to eq(MovieCast)
      expect(search_results.member.count).to eq(10)
      expect(search_results.member.first).to eq(["Tim Robbins", "Andy Dufresne"])
    end
  end

  describe 'json_to_index_object' do
    it 'converts json data to ruby objects' do
      movies_json = File.read('spec/fixtures/movies.json')
      data_hash = JSON.parse(movies_json, symbolize_names: true)
      
      json_movie_id = data_hash[:results].first[:id]
      json_movie_title = data_hash[:results].first[:title]

      movie_object = MovieFacade.json_to_index_object(data_hash[:results])

      object_movie_id = movie_object.first.id
      object_movie_title = movie_object.first.title

      expect(json_movie_id).to eq(object_movie_id)
      expect(json_movie_title).to eq(object_movie_title)
    end
  end
end