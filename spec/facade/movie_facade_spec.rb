require 'rails_helper'

RSpec.describe 'Movie Facade', :vcr do
  describe 'top40' do
    it 'returns 40 movies' do
      top_movies = MovieFacade.top40

      expect(top_movies.count).to eq(40)
    end
  end

  describe 'title_search_results'do
    it 'returns an array of movies related to the search' do
      search_movies = MovieFacade.title_search_results("Fight Club")

      expect(search_movies.class).to eq(Array)
      expect(search_movies.first.title).to eq("Fight Club")
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