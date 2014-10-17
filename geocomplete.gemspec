$:.push File.expand_path('../lib', __FILE__)
require 'geocomplete/version'

Gem::Specification.new do |s|
  s.name          = 'Geocomplete'
  s.version       = Geocomplete::VERSION 
  s.summary       = 'A simple and blazing fast micro-service for powering geographical places autocomplete.'
  s.description   = 'Geocomplete is a Rack based micro-service for powering a geograhical places autocomplete similar to Google Places Autocomplete.'
  s.authors       = ['doomspork']
  s.email         = 'seancallan@gmail.com'
  s.files         = ['lib/geocomplete.rb', 'LICENSE']
  s.homepage      = 'https://github.com/doomspork/geocomplete'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.required_ruby_version = '> 2.0'

  s.add_runtime_dependency 'rack', '~> 1.5'
  s.add_runtime_dependency 'rack-cors', '~> 0.2'
  s.add_runtime_dependency 'redis', '~> 3.1'
  s.add_runtime_dependency 'hiredis', '~> 0.5'
end
