class Asset < ApplicationRecord
  has_many :user_assets
  has_many :users, through: :user_assets

  def self.find_symbols(query)
    where('name LIKE ?', "%#{query.upcase}%").pluck(:symbol)
  end

  def attributes
    data = AssetApi.get(self.symbol).first

    {
      price: data['price'],
      circulating_supply: data['circulating_supply'],
      max_supply: data['max_supply'],
      market_cap: data['market_cap'],
      ath: data['high']
    }

  end
end
