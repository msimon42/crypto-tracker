class Asset < ApplicationRecord
  has_many :user_assets
  has_many :users, through: :user_assets

  def self.find_symbols(query)
    where('name LIKE ?', "%#{query.upcase}%").pluck(:symbol)
  end

  def attributes
    AssetFacade.new(self.symbol)
  end
end
