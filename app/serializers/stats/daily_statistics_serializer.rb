class Stats::DailyStatisticsSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attribute :day
  attribute :total_distance
  attribute :avg_ride
  attribute :avg_price

  def day
    object.date.strftime("%B, #{object.date.day.ordinalize}")
  end

  def total_distance
    "#{object.total_distance / 1000}km"
  end

  def avg_ride
    "#{object.avg_ride / 1000}km"
  end

  def avg_price
    number_to_currency(object.avg_price, unit: 'PLN', format: '%n%u')
  end
end
