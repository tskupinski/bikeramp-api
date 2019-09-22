require 'rails_helper'

RSpec.describe CalculateAverage do
  let!(:trips) { create_list(:trip, 2, price: 40.00) }

  subject { described_class.new(Trip.all, :price) }

  it 'returns average price for trips' do
    expect(subject.call).to eq(40.00)
  end

  context 'without trips' do
    before { Trip.delete_all }

    it 'returns 0' do
      expect(subject.call).to eq(0)
    end
  end
end
