# load our gem files
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# load our fake scalr API service
$LOAD_PATH.unshift File.expand_path('../../spec/support', __FILE__)

# allow us to change environment variables per test
require 'climate_control'

# allow us to stub API calls
require 'webmock/rspec'

# fake API service with sinatra
require 'fake_scalr'

# our gem
require 'scalr_api_v2'

blacklist = ['test.scalr.local']

allowed_sites = lambda do |uri|
  blacklist.none? { |site| uri.host.include?(site) }
end

WebMock.disable_net_connect!(allow: allowed_sites)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /test.scalr.local/).to_rack(FakeScalr)
  end
end

def with_modified_env(options, &block)
  ClimateControl.modify(options, &block)
end
