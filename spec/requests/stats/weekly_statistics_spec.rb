require 'rails_helper'

RSpec.describe 'Weekly Statistics API' do
  describe 'GET /api/stats/weekly' do
    let(:path) { '/api/stats/weekly' }

    let!(:current_week_trips) { create_list(:trip, 2, distance: 2000, price: 10.00) }
    let!(:other_week_trip) { create(:trip, date: 2.weeks.from_now) }

    subject! { get path }

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns weekly statistics' do
      expect(json_response['total_distance']).to eq('4km')
      expect(json_response['total_price']).to eq('20.00PLN')
    end
  end
end
