class User < ApplicationRecord
  has_many :user_assets
  has_many :assets, through: :user_assets

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates_confirmation_of :password

  has_secure_password
  enum role: ['regular', 'admin']

  def has_asset?(symb)
    assets.any? {|a| a.symbol == symb}
  end

  def asset_symbols
    assets.all.pluck(:symbol)
  end   
end
