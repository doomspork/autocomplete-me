$:.push File.expand_path('../lib', __FILE__)
require 'autocomplete-me/version'

Gem::Specification.new do |s|
  s.name          = 'autocomplete-me'
  s.version       = AutocompleteMe::VERSION 
  s.summary       = 'A simple and blazing fast micro-service for powering autocompletion.'
  s.description   = 'AutocompleteMe is a mountable Rack based micro-service for powering autocompletion functionality similar to Google Places Autocomplete'
  s.authors       = %w(doomspork)
  s.email         = 'seancallan@gmail.com'
  s.files         = %w(lib/autocomplete-me.rb LICENSE)
  s.homepage      = 'https://github.com/doomspork/autocomplete-me'
  s.license       = 'MIT'
  s.require_paths = %w(lib)
  s.executables   = %w(usgs warmup)

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rack',       '~> 1.5'
  s.add_dependency 'rack-cors',  '~> 0.2'
  s.add_dependency 'redis',      '~> 3.1'
  s.add_dependency 'hiredis',    '~> 0.5'
  s.add_dependency 'thor',       '~> 0.19'
end
