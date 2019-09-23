class MonthlyTripsQuery
  def call
    sort_by_date(monthly_trips)
  end

  private

  def monthly_trips
    Trip.where('date >= ? AND date <= ?', beginning_of_month, end_of_month)
  end

  def beginning_of_month
    Date.current.beginning_of_month
  end

  def end_of_month
    Date.current.end_of_month
  end

  def sort_by_date(relation)
    SortingQuery.new(relation, :date).call
  end
end
