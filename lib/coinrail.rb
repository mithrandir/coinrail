require 'coinrail/version'
require 'coinrail/http'
# CoinRail API doesn't support realtime API yet
#require 'coinrail/realtime'

module CoinRail
#  def realtime_client
#    Bitflyer::Realtime::Client.new
#  end

  def http_public_client
    CoinRail::HTTP::Public::Client.new
  end

  def http_private_client(key, secret)
    CoinRail::HTTP::Private::Client.new(key, secret)
  end

  module_function :http_public_client, :http_private_client
end
