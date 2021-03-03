class UserStocksController < ApplicationController

  def create
    stock = Stock.new_lookup(params[:ticker])
    # if stock.blank?
    #   stock = Stock.new_lookup(params[:ticker])
    #   stock.save
    # end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash.now[:notice] = "#{stock.name} was successfully added to stocks portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.find_by(stock_id: stock.id)
    user_stock.destroy
    flash.now[:notice] = "#{user_stock.stock.name} was successfully removed"
    redirect_to my_portfolio_path
  end

end
