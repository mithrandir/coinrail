# coinrail
coinrail is a wrapper interface of [CoinRail API](https://coinrail.co.kr/api/document). I borrowed original code from bitflyer API and modified for coinrail API.

## Installation

```sh
gem install coinrail
```

## Usage

See https://coinrail.co.kr/api/document for details.

### HTTP API

#### Example

```ruby 
public_client = CoinRail.http_public_client
p public_client.orderbook # will print orderbook snapshot
 
private_client = CoinRail.http_private_client('YOUR_API_KEY', 'YOUR_API_SECRET')
p private_client.pending # will print your pending orders
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mithrandir/coinrail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

