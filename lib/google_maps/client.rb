class GoogleMaps::Client
  include HTTParty

  API_KEY = ENV['GOOGLE_API_KEY']

  base_uri 'https://maps.googleapis.com'

  class << self
    def fetch_trip(options)
      options[:query].merge!(key: API_KEY)
      response = get('/maps/api/distancematrix/json?', options)

      if path_exists?(response)
        build_google_trip(response)
      else
        raise_error(response)
      end
    end

    private

    def path_exists?(response)
      response['status'] == 'OK' && response['rows'][0]['elements'][0]['status'] == 'OK'
    end

    def build_google_trip(response)
      GoogleMaps::Trip.new(response)
    end

    def raise_error(response)
      raise GoogleMaps::Error, response
    end
  end
end
