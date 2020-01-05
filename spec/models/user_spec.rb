require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_assets) }
  it { should have_many(:assets).through(:user_assets) }

  describe 'methods' do
    before :each do
      @user = create :user
      @assets = create_list :asset, 5
    end

    it 'has_asset?' do
      @user.assets << @assets[1]
      expect(@user.has_asset?(@assets[1].symbol)).to be true
      expect(@user.has_asset?(@assets[3].symbol)).to be false 
    end
  end
end
