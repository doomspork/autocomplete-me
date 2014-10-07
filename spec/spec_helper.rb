require 'simplecov'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

# Configure code coverage reporting
SimpleCov.start do
  add_filter '/spec/'
  coverage_dir 'docs/coverage'
end

# Load our env and service
require_relative '../config/environment'
require_relative '../service'

GeoAutocomplete.config { |c| c.redis = MockRedis.new }

# Load spec helpers and support classes
Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.pattern = '**/*_spec.rb'
  config.include Rack::Test::Methods
  config.include ResponseHelper
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.mock_framework = :rr

  def app
    GeoAutocomplete::Service.new
  end
end
