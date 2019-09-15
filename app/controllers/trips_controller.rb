class TripsController < ApplicationController
  def create
    submit_form(TripForm.new(trip_params))
  end

  private

  def trip_params
    params.permit(:start_address, :destination_address, :price, :date)
  end
end
