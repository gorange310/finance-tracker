class AddIndexToStocks < ActiveRecord::Migration[6.1]
  def change
    add_index :stocks, :ticker
  end
end
