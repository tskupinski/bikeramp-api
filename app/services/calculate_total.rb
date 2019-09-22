class CalculateTotal
  def initialize(trips, attribute)
    @trips = trips
    @attribute = attribute
  end

  def call
    trips.sum(&attribute)
  end

  private

  attr_reader :trips
  attr_reader :attribute
end
