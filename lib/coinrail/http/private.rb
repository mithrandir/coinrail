module CoinRail
  module HTTP
    module Private
      class Client
        def initialize(key, secret)
          @connection = Connection.new(key, secret)
          @key = key
        end

        def current_timestamp
          (Time.now.to_i * 1000)
        end

        def balance
          puts @key
          body = {timestamp: (Time.now.to_i * 1000).to_s,
                  access_key: @key}
          @connection.post('/balance', body.to_json).body
        end

        # def coin_ins
        #   @connection.get('/v1/me/getcoinins').body
        # end

        # def coin_outs
        #   @connection.get('/v1/me/getcoinouts').body
        # end

        # def bank_accounts
        #   @connection.get('/v1/me/getbankaccounts').body
        # end

        # def deposits
        #   @connection.get('/v1/me/getdeposits').body
        # end

        def wallet_info(currency)
          body = {currency: currency}.delete_if { |_, v| v.nil? }
          @connection.post('/wallet', body).body
        end

        def withdraw_coin(currency, address, amount)
          body = {
              currency: currency_code,
              address: address,
              amount: amount,
          }.delete_if { |_, v| v.nil? }
          @connection.post('/withdraw', body).body
        end

        # def withdrawals
        #   @connection.get('/v1/me/getwithdrawals').body
        # end

        def limit_buy(currency, price, qty)
          throw "limit_buy: all parameter should not be nil" if currency.nil? or price.nil? or qty.nil?
          body = {access_key: @key,
                  currency: currency,
                  price: price,
                  qty: qty,
                  timestamp: current_timestamp}
          @connection.post('/order/limit/buy', body).body
        end

        def limit_sell(currency, price, qty)
          throw "limit_sell: all parameter should not be nil" if currency.nil? or price.nil? or qty.nil?
          body = {access_key: @key,
                  currency: currency,
                  price: price,
                  qty: qty,
                  timestamp: current_timestamp}
          @connection.post('/order/limit/sell', body).body
        end

        def trade_completed(currency: nil, count: nil, offset: nil)
          query = {
            access_key: @key,
            currency: currency,
            count: count,
            offset: offset,
            timestamp: current_timestamp
          }.delete_if { |_, v| v.nil? }
          @connection.post('/trade/completed', query).body
        end


        alias_method :executions, :trade_completed

        def trade_pending(currency: nil, count: nil, offset: nil)
          query = {
            access_key: @key,
            currency: currency,
            count: count,
            offset: offset,
            timestamp: current_timestamp
          }.delete_if { |_, v| v.nil? }
          @connection.post('/trade/pending', query).body
        end
      end
    end
  end
end
