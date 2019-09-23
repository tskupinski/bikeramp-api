class PrepareMonthlyStatistics
  def call
    monthly_trips_by_date.map { |d, t| DailyStatistics.new(d, t) }
  end

  private

  def monthly_trips
    MonthlyTripsQuery.new.call
  end

  def monthly_trips_by_date
    monthly_trips.group_by(&:date)
  end
end
