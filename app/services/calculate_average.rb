class CalculateAverage
  def initialize(trips, attribute)
    @trips = trips
    @attribute = attribute
  end

  def call
    return 0 if trips.empty?

    trips.sum(&attribute) / trips.size
  end

  private

  attr_reader :trips
  attr_reader :attribute
end
