module CoinRail
  module HTTP
    module Public
      class Client
        def initialize
          @connection = Connection.new(nil, nil)
        end

        def orderbook(currency = 'btc-krw')
          @connection.get('/public/orderbook', {currency: currency }).body
        end

        alias_method :board, :orderbook

        def last_transaction(currency = 'btc-krw')
          @connection.get('/last/transaction',
                          { currency: currency.to_lower }).body
        end

        alias_method :executions, :last_transaction
      end
    end
  end
end
