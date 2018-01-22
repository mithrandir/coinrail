# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coinrail/version'

Gem::Specification.new do |spec|
  spec.name          = 'coinrail'
  spec.version       = CoinRail::VERSION
  spec.authors       = ['Park Jiin']
  spec.email         = ['tisphie@gmail.com']
  spec.summary       = %q{CoinRail API wrapper}
  spec.description   = %q{CoinRail API wrapper}
  spec.homepage      = 'https://github.com/mithrandir/coinrail'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.12.2'
  spec.add_dependency 'faraday_middleware', '~> 0.12.0'
  spec.add_dependency 'pubnub', '~> 4.0.22'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
