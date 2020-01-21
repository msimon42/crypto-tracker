class TradesController < ApplicationController
  def new
    @user_asset = UserAsset.find(params[:id])
  end

  def create
    trade = create_new_trade
    if trade.save
      flash[:success] = 'Trade recorded'
      redirect_to '/myassets'
    else
      flash[:danger] = trade.errors.full_messages.to_sentence
      redirect_back fallback_location: "/myassets/#{params[:id]}/trade"
    end
  end

  private

  def trade_params
    params.permit(:amount, :price_per_coin, :transaction_type)
  end

  def create_new_trade
    user_asset = UserAsset.find(params[:id])
    case params[:transaction_type]
    when 'Buy'
      trade = user_asset.trades.create(trade_params.merge!(transaction_type: 0))
    when 'Sell'
      trade = create_sell_transaction(user_asset)
    else
      flash[:danger] = 'Please try again.'
      redirect_back fallback_location: "/myassets/#{params[:id]}/trade" and return
    end
    trade
  end

  def create_sell_transaction(user_asset)
    if user_asset.amount <= params[:amount].to_f
      user_asset.trades.create(trade_params.merge!(transaction_type: 1, amount: user_asset.amount))
    else
      user_asset.trades.create(trade_params.merge!(transaction_type: 1))
    end
  end
end
