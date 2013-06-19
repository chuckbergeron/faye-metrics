require 'pry'

set :root, File.dirname(__FILE__)

get '/faye/stats' do
  "Hello #{env['stats']}"

  erb :stats
end