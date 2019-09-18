require 'rails_helper'

RSpec.describe FetchDistance, google_maps: true do
  let(:start_address) { 'Address1' }
  let(:destination_address) { 'Address2' }

  subject { described_class.new(start_address, destination_address) }

  it 'calculates distance between two addresses' do
    expect(subject.call).to eq(1045)
  end

  context 'with invalid address' do
    let(:start_address) { nil }

    it 'raises an error' do
      expect { subject.call }.to raise_error(GoogleMaps::Error)
    end
  end
end
