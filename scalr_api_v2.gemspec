# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scalr_api_v2/version'

Gem::Specification.new do |spec|
  spec.name          = 'scalr_api_v2'
  spec.version       = ScalrApiV2::VERSION
  spec.authors       = ['david.meekin']
  spec.email         = ['davemeekin.github@gmail.com']

  spec.summary       = 'ruby gem providing interface to Scalr API v2 methods'
  spec.description   = 'provides a connection to scalr and a non exhuastive list of api calls as methods.'
  spec.homepage      = 'https://github.com/autotraderuk'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'climate_control'
  spec.add_development_dependency 'rack', '~> 1.6.8'
  spec.add_development_dependency 'webmock', '~> 3.0.1'
  spec.add_development_dependency 'sinatra', '~>1.4.8'
  spec.add_development_dependency 'cucumber', '~> 2.4.0'
  spec.add_development_dependency 'aruba', '~>0.14.2'
  spec.add_development_dependency 'rubocop', '~>0.48.1'
  spec.add_dependency 'rest-client', '~>2.0.2'
  spec.add_dependency 'json', '~> 2.1.0'
  spec.add_dependency 'thor', '~> 0.19.4'
end
