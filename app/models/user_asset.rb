class UserAsset < ApplicationRecord
  belongs_to :user
  belongs_to :asset
  has_many :trades

  def value
    amount * asset.attributes[:price].to_f
  end

  def name
    asset.name.titleize
  end

  def price_per_coin
    asset.attributes[:price]
  end

  def amount
    bought = trades.where(transaction_type: 0).sum(:amount)
    sold = trades.where(transaction_type: 1).sum(:amount)

    bought - sold
  end
end
