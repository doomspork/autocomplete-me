module Geocomplete
  class Service

    def call(env)
      request = Rack::Request.new(env)
      term    = request.params['t']
      if term && (places = search(term))
        [200, { 'Content-Type' => 'application/json' }, [places.to_json]]
      else
        [400, { 'Content-Type' => 'application/json' }, ['']]
      end
    end

    private

    def search(term)
      members = redis.smembers("index:#{term}")
      members.map { |id| find(id) }
    end

    def find(id)
      value = redis.get("content:#{id}")
      JSON.parse(value)
    end

    def redis
      @redis ||= Geocomplete.config.redis
    end

  end
end
