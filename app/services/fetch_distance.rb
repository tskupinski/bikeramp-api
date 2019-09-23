class FetchDistance
  GOOGLE_API_KEY = ENV['GOOGLE_API_KEY']

  def initialize(start_address, destination_address, mode = :bicycling)
    @start_address = start_address
    @destination_address = destination_address
    @mode = mode
  end

  def call
    trip.distance
  end

  private

  attr_reader :start_address
  attr_reader :destination_address

  def trip
    @trip ||= GoogleMaps::Client.fetch_trip(options)
  end

  def options
    {
      query: {
        origins: @start_address,
        destinations: @destination_address,
        mode: @mode
      }
    }
  end
end
