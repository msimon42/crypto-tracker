class Trade < ApplicationRecord
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_numericality_of :price_per_coin, greater_than_or_equal_to: 0 

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
