class MovieService
  class << self
    def movie
      response = conn.get("/movie/555")
      parse_data(response)
    end

    private

    def conn
      conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
        faraday.headers["Authorization"] = "Bearer #{ENV['movie_db_token']}"
      end
    end

    def parse_data(response)
      binding.pry
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end