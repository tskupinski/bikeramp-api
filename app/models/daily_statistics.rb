class DailyStatistics
  include ActiveModel::Serializers::JSON

  attr_reader :date

  def initialize(date, trips)
    @date = date
    @trips = trips
  end

  def total_distance
    CalculateTotal.new(trips, :distance).call
  end

  def avg_ride
    CalculateAvarage.new(trips, :distance).call
  end

  def avg_price
    CalculateAverage.new(trips, :price).call
  end

  private

  attr_reader :trips
end
