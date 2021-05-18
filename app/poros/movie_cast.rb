class MovieCast
  attr_reader :member

  def initialize(data)
    @member = {}
    data[:cast].first(10).map do |member|
      @member[member[:name]] = member[:character]
    end
  end
end