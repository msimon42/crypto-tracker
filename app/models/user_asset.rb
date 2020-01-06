class UserAsset < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  def value
    amount * asset.attributes[:price].to_f
  end
end
