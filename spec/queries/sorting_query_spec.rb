require 'rails_helper'

RSpec.describe SortingQuery do
  before do
    create(:trip, date: Date.current)
    create(:trip, date: 1.day.from_now.to_date)
  end

  let(:trips) { Trip.order(date: direction) }

  subject { described_class.new(Trip.all, :date, direction) }

  context 'when direction is descending' do
    let(:direction) { 'desc' }

    it 'returns records in descending order' do
      expect(subject.call).to eq(trips.to_a)
    end
  end

  context 'when direction is ascending' do
    let(:direction) { 'asc' }

    it 'returns records in ascending order' do
      expect(subject.call).to eq(trips.to_a)
    end
  end

  context 'when the direction is invalid' do
    let(:direction) { 'invalid' }

    let(:trips) { Trip.order(:created_at) }

    it 'returns records in ascending order' do
      expect(subject.call).to eq(trips.to_a)
    end
  end

  context 'when the direction is not provided' do
    let(:direction) { 'asc' }

    subject { described_class.new(Trip.all, :created_at) }

    it 'returns records in ascending order' do
      expect(subject.call).to eq(trips.to_a)
    end
  end
end
