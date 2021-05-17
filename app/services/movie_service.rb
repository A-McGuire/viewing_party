class MovieService
  class << self
    def movie(id)
      response = conn.get("3/movie/#{id}")
      parse_data(response)
    end

    def top_rated_movies(page_number)
      response = conn.get('3/movie/top_rated') do |req|
        req.params['page'] = page_number
      end
      parse_data(response)
    end

    def title_search(movie_title)
      response = conn.get('3/search/movie') do |req|
        req.params['query'] = movie_title
      end
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.themoviedb.org/') do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV['movie_db_token']}" 
        faraday.headers['Accept'] = "*/*"
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
