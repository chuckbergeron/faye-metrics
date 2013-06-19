# This has been built against thin, and currently relies on a handful of gems:
#
#     gem install pry thin faye sinatra rack
#
# Start with:
#     rackup -E production -s thin config.ru -p 9292
#
#     or
#
#     thin start -R examples/ruby/config.ru -p 9292

require 'rubygems'
require 'thin'
require 'sinatra'
require 'pry'

require File.expand_path('../app', __FILE__)
require File.expand_path('../faye_metrics', __FILE__)
require File.expand_path('../sinatra', __FILE__)

use FayeMetrics, { faye_rack_adapter: App }

Faye::WebSocket.load_adapter('thin')

run App

