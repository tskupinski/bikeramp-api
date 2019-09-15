require 'support/fake_service'

class FakeGoogleMaps < FakeService
  get '/maps/api/distancematrix' do
    render :distance
  end
end
