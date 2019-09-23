require 'rails_helper'

RSpec.describe MonthlyTripsQuery do
  let!(:trip) { create(:trip, date: 2.days.from_now.to_date) }
  let!(:beginning_of_month_trip) { create(:trip, date: Date.current.beginning_of_month) }
  let!(:end_of_month_trip) { create(:trip, date: Date.current.end_of_month) }

  let!(:trip_from_another_month) { create(:trip, date: 1.month.from_now.to_date) }

  subject { described_class.new }

  before do
    travel_to Date.current.beginning_of_month
  end

  it 'returns trips from this week' do
    result = subject.call

    expect(result).to include(trip)
    expect(result).to include(beginning_of_month_trip)
    expect(result).to include(end_of_month_trip)
  end

  it 'does not return trips from other weeks' do
    expect(subject.call).not_to include(trip_from_another_month)
  end
end
