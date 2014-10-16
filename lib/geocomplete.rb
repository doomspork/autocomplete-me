require 'geocomplete/config'
require 'geocomplete/environment'
require 'geocomplete/service'

module Geocomplete
  extend self

  def config
    @config ||= Config.new
    yield @config if block_given?
    @config
  end

  def redis
    @redis ||= config.redis
  end
end
