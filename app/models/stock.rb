class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  validates :name, presence: true, :on => :create
  validates :ticker,
            presence: true,
            uniqueness: { case_sensitive: false },
            :on => :create

  before_validation { self.ticker = ticker.upcase }

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    begin client.quote(ticker_symbol)
      stock = Stock.check_db(ticker_symbol.upcase)

      if stock.present?
        stock.update_price
      else
        Stock.create(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
      end
    rescue => exception
      nil
    end
  end

  def self.check_db(ticker_symbol)
    Stock.find_by(ticker: ticker_symbol)
  end

  def update_price
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    stock.update(last_price: client.price(self.ticker))
  end
end
