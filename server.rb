require 'sinatra'
require 'memcached'
$cache = Memcached.new("#{ENV['MEMCACHED_PORT_11211_TCP_ADDR']}:#{ENV['MEMCACHED_PORT_11211_TCP_PORT']}")
 
set :bind, '0.0.0.0'
 
set :logging, true

start = 1
$cache.set 'counter', start.to_s, 0, false
 
get '/' do
  @count = $cache.increment 'counter'
  erb :index
end