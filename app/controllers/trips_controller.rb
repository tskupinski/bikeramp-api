class TripsController < ApplicationController
  rescue_from GoogleMaps::Error, with: :render_message

  def create
    submit_form(TripForm.new(trip_params))
  end

  private

  def trip_params
    params.permit(:start_address, :destination_address, :price, :date)
  end
end
