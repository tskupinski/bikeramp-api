class TripSerializer < ActiveModel::Serializer
  attribute :id
  attribute :start_address
  attribute :destination_address
  attribute :price
  attribute :date
end
