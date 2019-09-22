class WeeklyStatistics
  include ActiveModel::Serializers::JSON

  def total_distance
    @total_distance ||= CalculateTotalDistance.new(weekly_trips).call
  end

  def total_price
    @total_price ||= CalculateTotalPrice.new(weekly_trips).call
  end

  private

  def weekly_trips
    @weekly_trips ||= WeeklyTripsQuery.new.call
  end
end
