class UserAssetsController < ApplicationController
  def new
    symbols = Asset.find_symbols(params[:query])
    @assets = AssetApi.get_multiple(symbols)
  end

  def create
    asset = Asset.find_by(symbol: params[:symbol])
    current_user.assets << asset
    redirect_back fallback_location: '/myassets'
    flash[:success] = "#{asset.name} added."
  end

  def index
    @user = User.find(current_user.id)
  end

end
