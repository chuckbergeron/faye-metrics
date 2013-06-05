require 'sinatra'
require 'faye'
#require_relative 'faye_metrics'

set :root, __FILE__
set :logging, false

# App = Faye::RackAdapter.new(Sinatra::Application,
#   :mount   => '/bayeux',
#   :timeout => 25
# )

App = Faye::RackAdapter.new(:mount => '/bayeux', :timeout => 25)

# def App.log(message)
# end

App.bind(:subscribe) do |client_id, channel|
  puts "[  SUBSCRIBE] #{client_id} -> #{channel}"
end

App.bind(:unsubscribe) do |client_id, channel|
  puts "[UNSUBSCRIBE] #{client_id} -> #{channel}"
end

App.bind(:disconnect) do |client_id|
  puts "[ DISCONNECT] #{client_id}"
end

