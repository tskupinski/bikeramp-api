class TripForm
  include ActiveModel::Model

  attr_accessor :start_address
  attr_accessor :destination_address
  attr_accessor :price
  attr_accessor :date

  validates :start_address, presence: true
  validates :destination_address, presence: true
  validates :price, presence: true, numericality: true
  validates :date, presence: true, timeliness: { type: :date }

  def save
    Trip.create! do |trip|
      trip.start_address = start_address
      trip.destination_address = destination_address
      trip.price = price
      trip.date = date
      trip.distance = fetch_distance
    end
  end

  private

  def fetch_distance
    FetchDistance.new(start_address, destination_address).call
  end
end
