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
    asset.attributes[:price].to_f
  end

  def amount
    bought = trades.where(transaction_type: 0).sum(:amount)
    sold = trades.where(transaction_type: 1).sum(:amount)

    bought - sold
  end

  def percent_holdings
    value / user.user_assets.total_value
  end

  def one_day_change
    asset.attributes[:price_changes][:one_d].to_f * amount
  end

  def value
    amount * price_per_coin
  end

  def self.total_value
    all.sum { |ua| ua.value }
  end

  def self.percent_change
    usd_change = all.map { |ua| ua.one_day_change }.sum
    (usd_change / (total_value - usd_change)) * 100
  end
end
