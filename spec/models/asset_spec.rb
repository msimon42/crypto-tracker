require 'rails_helper'

RSpec.describe Asset, type: :model do
  it { should have_many(:user_assets) }
  it { should have_many(:users).through(:user_assets) }

  describe 'methods' do
    before :each do
      @asset = create :asset
    end

    it 'price' do
      expect(@asset.attributes[:price]).to eq('123')
    end

  end
end
