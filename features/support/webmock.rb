# load our fake scalr API service
$LOAD_PATH.unshift File.expand_path('/home/vagrant/scalr_api_v2/spec/support', __FILE__)
require 'webmock/cucumber'

# fake API service with sinatra
require 'fake_scalr'

blacklist = ['test.scalr.local']

allowed_sites = lambda do |uri|
  blacklist.none? { |site| uri.host.include?(site) }
end

WebMock.disable_net_connect!(allow: allowed_sites)
