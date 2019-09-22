require 'rails_helper'

RSpec.describe WeeklyTripsQuery do
  let!(:trip) { create(:trip, date: Date.current) }
  let!(:beginning_of_week_trip) { create(:trip, date: Date.current.beginning_of_week) }
  let!(:end_of_week_trip) { create(:trip, date: Date.current.end_of_week) }

  let!(:trip_from_another_week) { create(:trip, date: 2.weeks.ago) }
  
  subject { described_class.new }

  it 'returns trips from this week' do
    result = subject.call

    expect(result).to include(trip)
    expect(result).to include(beginning_of_week_trip)
    expect(result).to include(end_of_week_trip)
  end

  it 'does not return trips from other weeks' do
    expect(subject.call).not_to include(trip_from_another_week)
  end
end
