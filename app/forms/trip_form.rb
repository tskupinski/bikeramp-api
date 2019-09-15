class TripForm
  include ActiveModel::Model

  attr_accessor :start_address
  attr_accessor :destination_address
  attr_accessor :price
  attr_accessor :date

  validates :start_address, presence: true
  validates :destination_address, presence: true
  validates :price, presence: true, numericality: true
  validates :date, presence: true, timeliness: true

  def save
    create_trip
  end

  private

  def create_trip
    Trip.create! do |trip|
      trip.start_address = start_address
      trip.destination_address = destination_address
      trip.price = price
      trip.date = date
      trip.distance = calculate_distance
    end
  end

  def calculate_distance
    CalculateDistance.new(start_address, destination_address).call
  end
end
