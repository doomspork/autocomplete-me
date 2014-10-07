source 'https://rubygems.org'

gem 'geohash', github: 'davetroy/geohash'
gem 'rack'
gem 'rack-cors', require: 'rack/cors'
gem 'redis'
gem 'hiredis' # Load after Redis
gem 'unicorn'

group :production do
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'foreman'
  gem 'dotenv'
  gem 'icepick'
end

group :test do
  gem 'coveralls', require: false
  gem 'mock_redis'
  gem 'rack-test'
  gem 'rr'
  gem 'rspec'
  gem 'rspec-its'
  gem 'simplecov', require: false
end
