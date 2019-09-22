class WeeklyStatistics
  include ActiveModel::Serializers::JSON

  def total_distance

  end

  def total_price
    "20PLN"
  end

  def weekly_trips
    @weekly_trips ||= WeeklyTripsQuery.new.call
  end
end
