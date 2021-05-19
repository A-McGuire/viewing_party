require 'rails_helper'

RSpec.describe 'Movie Cast poros' do
  it 'has readable attributes' do
    movie_json = File.read('spec/fixtures/movie_cast.json')
    data_hash = JSON.parse(movie_json, symbolize_names: true)
    movie = MovieCast.new(data_hash)
    
    expect(movie.class).to eq(MovieCast)
    expect(movie.member.count).to eq(10)
    expect(movie.member.first.first).to eq("Edward Norton")
    expect(movie.member.first.last).to eq("The Narrator")
  end
end