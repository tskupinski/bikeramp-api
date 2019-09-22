require 'rails_helper'

RSpec.describe CalculateTotalDistance do
  let!(:trips) { create_list(:trip, 2, distance: 2000) }

  subject { described_class.new(Trip.all) }

  it 'returns total distance of trips' do
    expect(subject.call).to eq(4000)
  end

  context 'without trips' do
    before { Trip.delete_all }

    it 'returns 0' do
      expect(subject.call).to eq(0)
    end
  end
end
