require 'rails_helper'

RSpec.describe 'Monthly Statistics API' do
  describe 'GET /api/stats/monthly' do
    let(:path) { '/api/stats/monthly' }

    before do
      travel_to Date.current.beginning_of_month

      create(:trip, distance: 1000, price: 10.00, date: 2.days.from_now.to_date)
      create(:trip, distance: 2000, price: 20.00, date: 2.days.from_now.to_date)
      create(:trip, distance: 2000, price: 20.00, date: 3.days.from_now.to_date)

      create(:trip, distance: 2000, price: 20.00, date: 1.month.from_now.to_date)
      create(:trip, distance: 2000, price: 20.00, date: 2.months.from_now.to_date)
    end

    subject! { get path }

    it 'returns the 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns monthly statistics' do
      expect(json_response).to be_an(Array)
      expect(json_response).not_to be_empty

      expect(json_response[0]['day']).to be_present
      expect(json_response[0]['total_distance']).to be_present
      expect(json_response[0]['avg_ride']).to be_present
      expect(json_response[0]['avg_price']).to be_present
    end
  end
end
