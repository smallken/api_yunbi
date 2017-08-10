class TickersController < ApplicationController
  def index
    @tickers = Ticker.all
  end
  def update_price
    ticker = Ticker.find(params[:id])

    response = RestClient.get "https://yunbi.com//api/v2/tickers/#{ticker.ticker_id}" # 因为我们之前保存过币种id的值的，现在可以调用啦！

data = JSON.parse(response.body)
ticker.update(:timestamp_at => data["at"],
               :price_buy => data["ticker"]["buy"],
               :price_sell => data["ticker"]["sell"],
               :price_low => data["ticker"]["low"],
               :price_high => data["ticker"]["high"],
               :trade_vol => data["ticker"]["vol"],
               :price_last => data["ticker"]["last"],
               :current_price => data["ticker"]["last"])


redirect_to tickers_path
  end
end
