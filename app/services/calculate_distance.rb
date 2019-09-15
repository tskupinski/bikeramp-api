class CalculateDistance
  GOOGLE_API_KEY = ENV['GOOGLE_API_KEY']

  def initialize(start_address, destination_address)
    @start_address = start_address
    @destination_address = destination_address
  end

  def call
    calculate_distance
  end
  
  private

  attr_reader :start_address
  attr_reader :destination_address

  def calculate_distance
    path = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{start_address}&destinations=#{destination_address}&key=#{GOOGLE_API_KEY}"

    response = HTTParty.get(path)

    # TODO Move to client
    response['rows'][0]['elements'][0]['distance']['value']/1000
  end
end
