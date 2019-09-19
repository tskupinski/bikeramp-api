require 'support/fake_service'

class FakeGoogleMaps < FakeService
  get '/maps/api/distancematrix/json?' do
    if params[:origins].present?
      render :distance
    else
      render :error
    end
  end
end
