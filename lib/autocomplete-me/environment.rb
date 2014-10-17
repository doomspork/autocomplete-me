require 'json'
require 'logger'
require 'redis'
require 'hiredis'

ENV['RACK_ENV'] ||= 'development'

Bundler.require(:default, ENV['RACK_ENV'])
