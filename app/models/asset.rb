class Asset < ApplicationRecord
  has_many :user_assets
  has_many :users, through: :user_assets

  def self.find_symbols(query)
    where('name LIKE ?', "%#{query.upcase}%").pluck(:symbol)
  end

  def price

  end

  def circulating_supply

  end

  def max_supply

  end

  def market_cap

  end

  def ath

  end           
end
