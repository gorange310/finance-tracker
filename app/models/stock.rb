class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true, uniqueness: {case_sensitive: false}

  before_create { self.ticker = ticker.upcase }

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
              publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
              endpoint: 'https://sandbox.iexapis.com/v1')
    begin client.quote(ticker_symbol)
      stock = Stock.check_db(ticker_symbol.upcase!)
      if stock
        update_price(stock.id)
      else
        create!(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
      end
    rescue => exception
      nil
    end
  end

  def self.check_db(ticker_symbol)
    find_by(ticker: ticker_symbol)
  end

  def self.update_price(stock_id)
    client = IEX::Api::Client.new(
              publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
              endpoint: 'https://sandbox.iexapis.com/v1')
    Stock.update(stock_id, last_price: client.price(Stock.find(stock_id).ticker))
  end

end
