require 'bundler/setup'
require 'json'
require 'logger'

ENV['RACK_ENV'] ||= 'development'

Bundler.require(:default, ENV['RACK_ENV'])
Dotenv.load(*%W(.env .env.#{ENV['RACK_ENV']}))

module GeoAutocomplete
  extend self

  class Config < Struct.new(:logger, :redis)
  end

  def config
    @config ||= Config.new
    yield @config if block_given?
    @config
  end
end

redis_config = {
  driver: :hiredis,
  logger: Logger.new(STDOUT)
}
redis_config[:url]  = ENV['REDIS_URL']  if ENV['REDIS_URL']
redis_config[:path] = ENV['REDIS_PATH'] if ENV['REDIS_PATH']

GeoAutocomplete.config do |c|
  c.logger       ||= Logger.new(STDOUT)
  c.logger.level   = ENV['LOG_LEVEL'] || Logger::INFO
  c.redis        ||= Redis.new(redis_config)
end
