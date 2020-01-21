class Trade < ApplicationRecord
  belongs_to :user_asset
  enum transaction_type:['buy', 'sell']

  def basis
    amount * price_per_coin
  end

  def change_since_transaction(current_price)
    ((current_price - price_per_coin) / price_per_coin) * 100
  end

  def asset
    user_asset.asset
  end
end
