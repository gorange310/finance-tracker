class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
  validates_uniqueness_of :ticker

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
              publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
              endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      new(ticker: ticker_symbol, 
          name: client.company(ticker_symbol).company_name,
          last_price: client.price(ticker_symbol))
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
