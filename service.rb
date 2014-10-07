module GeoAutocomplete
  class Service

    def call(env)
      request = Rack::Request.new(env)
      term    = request.params['t']
      if term && (places = redis.get(term))
        [200, { 'Content-Type' => 'application/json' }, places ]
      else
        [400, { 'Content-Type' => 'application/json' }, '' ]
      end
    end

    def redis
      @redis ||= GeoAutocomplete.config.redis
    end

  end
end
