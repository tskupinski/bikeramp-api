class TripSerializer < ActiveModel::Serializer
  attribute :id
  attribute :start_address
  attribute :destination_address
  attribute :price
  attribute :date
  attribute :distance

  def distance
    "#{object.distance}m"
  end
end
