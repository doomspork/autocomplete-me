require 'autocomplete-me/config'
require 'autocomplete-me/environment'
require 'autocomplete-me/service'

module AutocompleteMe
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
