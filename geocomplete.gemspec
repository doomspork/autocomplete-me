$:.push File.expand_path('../lib', __FILE__)
require 'geocomplete/version'

Gem::Specification.new do |s|
  s.name          = 'Geocomplete'
  s.version       = Geocomplete::VERSION 
  s.summary       = 'A simple and blazing fast micro-service for powering geographical places autocomplete.'
  s.description   = ''
  s.authors       = ['doomspork']
  s.email         = 'seancallan@gmail.com'
  s.files         = ['lib/geocomplete.rb', 'LICENSE']
  s.homepage      = 'https://github.com/doomspork/geocomplete'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.required_ruby_version = '> 2.0'

  s.add_runtime_dependency 'rack'
  s.add_runtime_dependency 'rack-cors'
  s.add_runtime_dependency 'redis'
  s.add_runtime_dependency 'hiredis'
end
