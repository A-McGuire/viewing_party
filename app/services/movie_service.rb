class MovieService
  class << self
    def movie
      response = conn.get("3/movie/555")
      parse_data(response)
    end

    private

    def conn
      conn = Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
        faraday.headers["Authorization"] = "Bearer #{ENV['movie_db_token']}"
        # faraday.params["api_key"] = ENV['movie_db_key']
      end
    end

    def parse_data(response)
      binding.pry
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end