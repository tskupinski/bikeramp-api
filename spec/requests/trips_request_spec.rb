require 'rails_helper'

RSpec.describe 'Trips API', google_maps: true do
  describe 'POST /api/trips' do
    let(:path) { '/api/trips' }

    let(:params) { load_json_fixture(:trip) }

    subject! { post path, params: params }

    it 'returns the 201 status code' do
      expect(response).to have_http_status(201)
    end

    it 'creates a trip' do
      expect(Trip.count).to eq(1)
    end

    it 'returns trip details' do
      expect(json_response['id']).to be_present
      expect(json_response['start_address']).to be_present
      expect(json_response['destination_address']).to be_present
      expect(json_response['price']).to be_present
      expect(json_response['date']).to be_present
    end

    context 'with invalid parameters' do
      let(:params) { 'invalid_params' }

      it 'returns the 400 status code' do
        expect(response).to have_http_status(400)
      end

      it 'returns error messages' do
        expect(json_response['errors']).to be_present
      end
    end
  end
end
