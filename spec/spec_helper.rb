ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'

require 'autocomplete-me'

# Configure code coverage reporting
SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]

SimpleCov.start do
  add_filter '/spec'
  coverage_dir 'docs/coverage'
  minimum_coverage(95.0)
end

AutocompleteMe.config { |c| c.redis = MockRedis.new }

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
    AutocompleteMe::Service.new
  end
end
