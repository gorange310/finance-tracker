class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
              publishable_token: 'Tpk_4bfb750a11fe4d6fa4e6a1474b03acf3',
              endpoint: 'https://sandbox.iexapis.com/v1')
    client.price(ticker_symbol)
  end


end
