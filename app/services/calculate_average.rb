class CalculateAverage
  def initialize(trips, attribute)
    @trips = trips
    @attribute = attribute
  end

  def call
    trips.average(attribute) || 0
  end

  private

  attr_reader :trips
  attr_reader :attribute
end
