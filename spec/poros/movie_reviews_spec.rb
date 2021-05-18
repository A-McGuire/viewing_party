require 'rails_helper'

RSpec.describe 'Movie Reviews poros' do
  it 'has readable attributes' do
    movie_json = File.read('spec/fixtures/movie_review.json')
    data_hash = JSON.parse(movie_json, symbolize_names: true)
    movie = MovieReviews.new(data_hash)
    first_review = "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."

    expect(movie.class).to eq(MovieReviews)
    expect(movie.total_results).to eq(5)
    expect(movie.authors.first.first).to eq("Goddard")
    expect(movie.authors.first.last).to eq(first_review)
  end
end