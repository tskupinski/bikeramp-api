require 'rails_helper'

RSpec.describe CalculateDistance, google_maps: true do
  let(:start_address) { 'Address 1' }
  let(:destination_address) { 'Address 2' }

  subject { described_class.new(start_address, destination_address) }

  it 'calculates distance between two addresses' do
    expect(subject.call).to eq(1.0)
  end
end
