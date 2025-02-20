require 'rails_helper'

RSpec.describe 'Movie Index poros' do
  it 'has readable attributes' do
    movie_json = File.read('spec/fixtures/movie.json')
    data_hash = JSON.parse(movie_json, symbolize_names: true)
    movie = MovieIndex.new(data_hash)

    expect(movie.class).to eq(MovieIndex)
    expect(movie.id).to eq(19404)
    expect(movie.title).to eq('Dilwale Dulhania Le Jayenge')
    expect(movie.vote_average).to eq(8.7)
  end
end