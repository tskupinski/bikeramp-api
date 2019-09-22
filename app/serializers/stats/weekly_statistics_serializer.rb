class Stats::WeeklyStatisticsSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attribute :total_distance
  attribute :total_price

  def total_distance
    "#{object.total_distance / 1000}km"
  end

  def total_price
    number_to_currency(object.total_price, unit: 'PLN', format: '%n%u')
  end
end
