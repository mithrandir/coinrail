require 'coinrail'
require 'coinrail/http/public'
require 'coinrail/http/private'
require 'faraday'
require 'faraday_middleware'
require 'openssl'
require 'base64'

module CoinRail
  module HTTP
    class Connection
      extend Forwardable

      def_delegators :@connection, :get, :post

      def initialize(key, secret)
        @connection = Faraday::Connection.new(:url => 'https://api.coinrail.co.kr') do |f|
          f.request :json
          f.response :json
          f.use Authentication, key, secret
          f.adapter Faraday.default_adapter
        end
      end
    end

    class Authentication < Faraday::Middleware
      def initialize(app, key, secret)
        super(app)
        @key = key
        @secret = secret
      end

      def call(env)
        return @app.call(env) if @key.nil? || @secret.nil?

        timestamp = Time.now.to_i.to_s
        method = env[:method].to_s.upcase
        path = env[:url].path + (env[:url].query ? '?' + env[:url].query : '')
        body = env[:body] || ''
        encoded_payload = Base64.strict_encode64(body)
        signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha512'), @secret, encoded_payload)
        env[:request_headers]['X-COINRAIL-PAYLOAD'] = encoded_payload
        env[:request_headers]['X-COINRAIL-SIGNATURE'] = signature
        @app.call env
      end
    end
  end
end
