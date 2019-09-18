class GoogleMaps::Trip
  def initialize(response)
    @response = response
  end

  def distance
    response['rows'][0]['elements'][0]['distance']['value']
  end

  private

  attr_reader :response
end
