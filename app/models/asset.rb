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
      ath: data['high'],
      logo: data['logo_url'],
      price_changes: {
        one_d: data['1d']['price_change'],
        seven_d: data['7d']['price_change'],
        thirty_d: data['30d']['price_change'],
        one_y: data['365d']['price_change']
      }
    }
  end

  def user_amt

  end
end
