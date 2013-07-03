# This has been built against thin, and currently relies on a handful of gems:
#
#     gem install pry thin faye sinatra rack
#
# Start with:
#
#     rackup -E production -s thin config.ru -p 9292
#
#     or
#
#     thin start -R examples/ruby/config.ru -p 9292

# TODO:
# Add faye-redis & `brew install nginx` for multi-proc support
#
#     gem install pry thin faye sinatra rack

require 'rubygems'
require 'faye'
require 'thin'
require 'sinatra'
require 'pry'

require './faye'
require './faye_metrics'
require './sinatra'

# This is where we step in to bind various listeners and store stats
use FayeMetrics, App

# run Sinatra::Application
run App
