class AssetsController < ApplicationController
  def index
    assets = AssetService.new.get_all
    @paginatable_assets = Kaminari.paginate_array(assets).page(params[:page]).per(100)
  end

  def show
    @asset = AssetService.new.get(params[:name]).first
    @asset_metadata = AssetApi.get_metadata(params[:name]).first
  end
end
