class WeeklyStatistics
  include ActiveModel::Serializers::JSON

  def total_distance
    CalculateTotal.new(weekly_trips, :distance).call
  end

  def total_price
    CalculateTotal.new(weekly_trips, :price).call
  end

  private

  def weekly_trips
    @weekly_trips ||= WeeklyTripsQuery.new.call
  end
end
