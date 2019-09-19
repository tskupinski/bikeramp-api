ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'spec_helper'
require 'webmock/rspec'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.fixture_path = 'spec/fixtures/files'

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include ActiveJob::TestHelper
  config.include ActionDispatch::TestProcess::FixtureFile
  config.include ActiveSupport::Testing::TimeHelpers
  config.include FactoryBot::Syntax::Methods
  config.include RequestHelpers, type: :request

  config.before(:example, google_maps: true) do
    stub_request(:any, /maps.googleapis.com/).to_rack(FakeGoogleMaps)
  end

  def load_json_fixture(name)
    data = file_fixture("../#{name}.json").read
    JSON.parse(data).with_indifferent_access
  end
end
