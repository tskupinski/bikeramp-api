class MonthlyTripsQuery
  def call
    Trip.where('date >= ? AND date <= ?', beginning_of_month, end_of_month)
  end

  private

  def beginning_of_month
    Date.current.beginning_of_month
  end

  def end_of_month
    Date.current.end_of_month
  end
end
