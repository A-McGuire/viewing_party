class MovieFacade
  class << self
    def top40
      movies1 = MovieService.top_rated_movies(1)
      movies2 = MovieService.top_rated_movies(2)
      movies = movies1[:results].concat(movies2[:results])
      json_to_object(movies)
    end

    def title_search_results(params)
      title_search = MovieService.title_search(params.gsub(' ', '+'))
      movies = title_search[:results]
      json_to_object(movies)
    end

    def id_search_results(movie_id)
      id_search = MovieService.movie(movie_id)
    end

    def reviews_search_results(movie_id)
      reviews_search = MovieService.movie_reviews(movie_id)
    end

    def cast_search_results(movie_id)
      cast_search = MovieService.movie_cast(movie_id)
    end

    def json_to_object(data)
      data.map do |movie|
        Movie.new(movie)
      end
    end
  end
end
