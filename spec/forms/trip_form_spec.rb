require 'rails_helper'

RSpec.describe TripForm do
  let(:params) { load_json_fixture(:trip) }

  subject { described_class.new(params) }

  context 'with valid parameters' do
    it 'passes the validation' do
      expect(subject.valid?).to eq(true)
    end
  end

  context 'without a start address' do
    before { params.delete('start_address') }

    it 'fails the validation' do
      expect(subject.valid?).to eq(false)
    end
  end

  context 'without a destination address' do
    before { params.delete('destination_address') }

    it 'fails the validation' do
      expect(subject.valid?).to eq(false)
    end
  end

  context 'without a price' do
    before { params.delete('price') }

    it 'fails the validation' do
      expect(subject.valid?).to eq(false)
    end
  end

  context 'with invalid price ' do
    before { params['price'] = 'invalid price' }

    it 'fails the validation' do
      expect(subject.valid?).to eq(false)
    end
  end

  context 'without a date' do
    before { params.delete('date') }

    it 'fails the validation' do
      expect(subject.valid?).to eq(false)
    end
  end

  context 'with invalid date' do
    before { params['date'] = 'invalid date' }

    it 'fails the validation' do
      expect(subject.valid?).to eq(false)
    end
  end
end
