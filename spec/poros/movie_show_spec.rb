require 'rails_helper'

RSpec.describe 'Movie Show poros' do
  it 'has readable attributes' do
    movie_json = File.read('spec/fixtures/movie.json')
    data_hash = JSON.parse(movie_json, symbolize_names: true)
    movie = MovieShow.new(data_hash)
    overview = "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga."

    expect(movie.class).to eq(MovieShow)
    expect(movie.id).to eq(19404)
    expect(movie.title).to eq('Dilwale Dulhania Le Jayenge')
    expect(movie.vote_average).to eq(8.7)
    expect(movie.runtime).to eq(190)
    expect(movie.overview).to eq(overview)
    expect(movie.genres).to eq(["Comedy", "Drama", "Romance"])
  end
end