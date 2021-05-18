class MovieFacade
  class << self
    def top40
      movies1 = MovieService.top_rated_movies(1)
      movies2 = MovieService.top_rated_movies(2)
      movies = movies1[:results].concat(movies2[:results])
      json_to_index_object(movies)
    end

    def title_search_results(params)
      title_search = MovieService.title_search(params.gsub(' ', '+'))
      movies = title_search[:results]
      json_to_index_object(movies)
    end

    def id_search_results(movie_id)
      id_search = MovieService.movie(movie_id)
      json_to_show_object(id_search)
    end

    def reviews_search_results(movie_id)
      reviews_search = MovieService.movie_reviews(movie_id)
      json_to_reviews_object(reviews_search)
    end

    def cast_search_results(movie_id)
      cast_search = MovieService.movie_cast(movie_id)
    end

    def json_to_index_object(data)
      data.map do |movie|
        MovieIndex.new(movie)
      end
    end

    def json_to_show_object(data)
      MovieShow.new(data)
    end

    def json_to_reviews_object(data)
      data.map do |review|
        MovieReviews.new(data)
      end
    end
  end
end
