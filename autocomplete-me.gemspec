$:.push File.expand_path('../lib', __FILE__)
require 'autocomplete-me/version'

Gem::Specification.new do |s|
  s.name          = 'autocomplete-me'
  s.version       = AutocompleteMe::VERSION 
  s.summary       = 'A simple and blazing fast micro-service for powering autocompletion.'
  s.description   = 'AutocompleteMe is a mountable Rack based micro-service for powering autocompletion functionality similar to Google Places Autocomplete'
  s.authors       = ['Sean Callan']
  s.email         = ['seancallan@gmail.com']
  s.homepage      = 'https://github.com/doomspork/autocomplete-me'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rack',       '~> 1.5'
  s.add_dependency 'rack-cors',  '~> 0.4'
  s.add_dependency 'redis',      '~> 3.2.1'
  s.add_dependency 'hiredis',    '~> 0.6'
  s.add_dependency 'thor',       '~> 0.19.1'
end
