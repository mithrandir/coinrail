module CoinRail
  module HTTP
    module Private
      class Client
        def initialize(key, secret)
          @connection = Connection.new(key, secret)
          @key = key
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

        # def withdraw(currency_code: 'KRW', bank_account_id: nil, amount: nil, code: nil)
        #   body = {
        #       currency_code: currency_code,
        #       bank_account_id: bank_account_id,
        #       amount: amount,
        #       code: code
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.post('/v1/me/withdraw', body).body
        # end

        # def withdrawals
        #   @connection.get('/v1/me/getwithdrawals').body
        # end

        # def send_child_order(product_code: 'BTC_JPY', child_order_type: nil, side: nil, price: nil, size: nil, minute_to_expire: nil, time_in_force: 'GTC')
        #   body = {
        #       product_code: product_code,
        #       child_order_type: child_order_type,
        #       side: side,
        #       price: price,
        #       size: size,
        #       minute_to_expire: minute_to_expire,
        #       time_in_force: time_in_force
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.post('/v1/me/sendchildorder', body).body
        # end

        # def cancel_child_order(product_code: 'BTC_JPY', child_order_id: nil, child_order_acceptance_id: nil)
        #   body = {
        #       product_code: product_code,
        #       child_order_id: child_order_id,
        #       child_order_acceptance_id: child_order_acceptance_id
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.post('/v1/me/cancelchildorder', body).body
        # end

        # def send_parent_order(order_method: nil, minute_to_expire: nil, time_in_force: 'GTC', parameters: {})
        #   body = {
        #       order_method: order_method,
        #       minute_to_expire: minute_to_expire,
        #       time_in_force: time_in_force,
        #       parameters: parameters
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.post('/v1/me/sendparentorder', body).body
        # end

        # def cancel_parent_order(product_code: 'BTC_JPY', parent_order_id: nil, parent_order_acceptance_id: nil)
        #   body = {
        #       product_code: product_code,
        #       parent_order_id: parent_order_id,
        #       parent_order_acceptance_id: parent_order_acceptance_id
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.post('/v1/me/cancelparentorder', body).body
        # end

        # def cancel_all_child_orders(product_code: 'BTC_JPY')
        #   @connection.post('/v1/me/cancelallchildorders', { product_code: product_code }).body
        # end

        # def child_orders(product_code: 'BTC_JPY', count: nil, before: nil, after: nil, child_order_state: nil, parent_order_id: nil)
        #   query = {
        #       product_code: product_code,
        #       count: count,
        #       before: before,
        #       after: after,
        #       child_order_state: child_order_state,
        #       parent_order_id: parent_order_id
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.get('/v1/me/getchildorders', query).body
        # end

        # def parent_orders(product_code: 'BTC_JPY', count: nil, before: nil, after: nil, parent_order_state: nil)
        #   query = {
        #       product_code: product_code,
        #       count: count,
        #       before: before,
        #       after: after,
        #       parent_order_state: parent_order_state
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.get('/v1/me/getparentorders', query).body
        # end

        # def parent_order(parent_order_id: nil, parent_order_acceptance_id: nil)
        #   query = {
        #       parent_order_id: parent_order_id,
        #       parent_order_acceptance_id: parent_order_acceptance_id
        #   }.delete_if { |_, v| v.nil? }
        #   @connection.get('/v1/me/getparentorder', query).body
        # end

        def trade_completed(currency: 'btc-krw', count: nil, offset: nil, timestamp: nil)
          query = {
              currency: currency,
              count: count,
              offset: offset,
              timestamp: timestamp
          }.delete_if { |_, v| v.nil? }
          @connection.get('/trade/completed', query).body
        end

        alias_method :executions, :trade_completed

        def trade_pending(currency: 'btc-krw')
          @connection.get('/trade/pending', { currency: currency }).body
        end
      end
    end
  end
end
