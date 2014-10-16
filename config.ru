require 'rack/cors'

ENV['RACK_ENV'] ||= 'development'

$stdout.sync = true

require 'geocomplete'
require 'geocomplete/initializer'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i(get post options)
  end
end

run Geocomplete::Service
