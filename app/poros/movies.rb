class Movies
  class << self
    def top40
      movies1 = MovieService.top_rated_movies(1)
      movies2 = MovieService.top_rated_movies(2)
      movies1[:results].concat(movies2[:results])
    end

    def title_search_results(params)
      title_search = MovieService.title_search(params.gsub(' ', '+'))
      title_search[:results]
    end
  end
end
