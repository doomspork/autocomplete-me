module Geocomplete
  def redis_options
    unless @redis_options
      @redis_options = {
        driver: :hiredis,
        logger: Logger.new(STDOUT)
      }
      @redis_options[:url]  = ENV['REDIS_URL']  if ENV['REDIS_URL']
      @redis_options[:path] = ENV['REDIS_PATH'] if ENV['REDIS_PATH']
    end
    @redis_options
  end

  config do |c|
    c.logger       ||= Logger.new(STDOUT)
    c.logger.level   = ENV['LOG_LEVEL'] || Logger::INFO
    c.redis        ||= Redis.new(redis_options)
  end
end
