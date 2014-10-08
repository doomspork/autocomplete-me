require 'logger'

$stdout.sync = true

require_relative 'config/environment'
require_relative 'service'

set :run, false

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i(get post options)
  end
end

run Geocomplete::Service
