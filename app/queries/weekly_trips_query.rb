class WeeklyTripsQuery
  def call
    Trip.where('date >= ? AND date <= ?', beginning_of_week, end_of_week)
  end

  private

  def beginning_of_week
    Date.current.beginning_of_week
  end

  def end_of_week
    Date.current.end_of_week
  end
end
