require 'support/fake_service'

class FakeGoogleMaps < FakeService
  get '/maps/api/distancematrix/json?origins=Address1&destinations=Address2/*' do
    render :distance
  end
end
