require 'rails_helper'

RSpec.describe PrepareMonthlyStatistics do
  before do
    travel_to Date.current.beginning_of_month

    create(:trip, distance: 1000, price: 10.00, date: 2.days.from_now.to_date)
    create(:trip, distance: 2000, price: 20.00, date: 2.days.from_now.to_date)
    create(:trip, distance: 2000, price: 20.00, date: 3.days.from_now.to_date)

    create(:trip, distance: 2000, price: 20.00, date: 1.month.from_now.to_date)
    create(:trip, distance: 2000, price: 20.00, date: 2.months.from_now.to_date)
  end

  subject { described_class.new }

  it 'returns monthly statistics' do
    result = subject.call

    expect(result).to be_an(Array)
    expect(result.count).to eq(2)

    expect(result[0].date).to eq(2.days.from_now.to_date)
    expect(result[0].total_distance).to eq(3000)
    expect(result[0].avg_ride).to eq(1500)
    expect(result[0].avg_price).to eq(15)
  end
end
