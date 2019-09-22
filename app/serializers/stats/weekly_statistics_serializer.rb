class Stats::WeeklyStatisticsSerializer < ActiveModel::Serializer
  attribute :total_distance
  attribute :total_price
end
