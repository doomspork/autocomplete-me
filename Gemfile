source 'https://rubygems.org'

gem 'rack'
gem 'rack-cors', require: 'rack/cors'
gem 'redis'
gem 'hiredis' # Load after Redis
gem 'thor'
gem 'unicorn'

group :production do
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'dotenv'
  gem 'foreman'
  gem 'icepick'
  gem 'rubyzip'
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
