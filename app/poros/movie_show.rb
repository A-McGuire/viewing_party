class MovieShow
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :overview,
              :genres

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @overview = data[:overview]
    @genres = data[:genres]
  end
end
