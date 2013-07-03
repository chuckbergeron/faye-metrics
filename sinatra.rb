# Settings
# set :logging, false
set :root, File.dirname(__FILE__)

get '/faye/stats' do
  @stats = env['stats']

  erb :stats
end

get '/assets/application.js' do
  js :application
end

get '/assets/application.css' do
  css :application
end