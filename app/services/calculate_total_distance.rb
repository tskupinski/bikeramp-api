class CalculateTotalDistance
  def initialize(trips)
    @trips = trips
  end

  def call
    trips.sum(&:distance)
  end

  private

  attr_reader :trips
end
