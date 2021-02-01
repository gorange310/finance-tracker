class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock].upcase!)
      if @stock
        respond_to do |format|
          format.js { render partial: "stocks/result", status: :ok }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: "stocks/result" }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: "stocks/result" }
      end
    end
  end

  def update
    stock = Stock.update_price(params[:id])
    if stock.update(params.permit(:id))
      flash.now[:notice] = "#{stock} updated"
      redirect_to my_portfolio_path
    else
      flash.now[:alert] = "Error! #{stock} update failed!"
      redirect_to my_portfolio_path
    end
  end

end