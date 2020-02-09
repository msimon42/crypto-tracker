class Asset < ApplicationRecord
  has_many :user_assets
  has_many :users, through: :user_assets

  def self.find_symbols(query)
    where('name LIKE ?', "%#{query.upcase}%").pluck(:symbol)
  end

  def attributes
    data = AssetService.new.get(self.symbol).first

    result = {
      price: data['price'],
      circulating_supply: data['circulating_supply'],
      max_supply: data['max_supply'],
      market_cap: data['market_cap'],
      ath: data['high'],
      logo: data['logo_url'],
      price_changes: {
        one_d: data['1d'],
        seven_d: data['7d'],
        thirty_d: data['30d'],
        one_y: data['365d']
      }
    }

    result[:price_changes].each do |k,v|
      if v
        result[:price_changes].merge!(k => v['price_change'])
      else
        result[:price_changes].merge!(k => 0.00)
      end
    end

    result
  end

end
