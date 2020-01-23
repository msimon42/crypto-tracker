require 'rails_helper'

RSpec.describe Trade, type: :model do
  describe 'validations' do
    it {should belong_to :user_asset}
    it {should validate_numericality_of :amount}
    it {should validate_numericality_of :price_per_coin}
  end
end
