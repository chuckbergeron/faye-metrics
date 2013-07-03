Faye::WebSocket.load_adapter('thin')

# TODO: Using Redis
#
# require 'faye/redis'
#
# App = Faye::RackAdapter.new(Sinatra::Application,
#   :mount   => '/bayeux',
#   :timeout => 25,
#   :engine  => {
#     :type  => Faye::Redis,
#     :host  => 'localhost',
#     :port  => 6379
#   }
# )


App = Faye::RackAdapter.new(Sinatra::Application,
  :mount   => '/bayeux',
  :timeout => 25
)

App.bind(:subscribe) do |client_id, channel|
  puts "[  SUBSCRIBE] #{client_id} -> #{channel}"
end

App.bind(:unsubscribe) do |client_id, channel|
  puts "[UNSUBSCRIBE] #{client_id} -> #{channel}"
end

App.bind(:disconnect) do |client_id|
  puts "[ DISCONNECT] #{client_id}"
end
