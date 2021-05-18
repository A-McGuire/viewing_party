class MovieReviews
  attr_reader :total_results,
              :authors

  def initialize(data)
    @total_results = data[:total_results]
    @authors = data[:results].map do |result|
      {author: result[:author], content: result[:content]}
    end
  end
end
