class Trade < ApplicationRecord
  belongs_to :user_asset
  enum transaction_type:['buy', 'sell']
  
end
