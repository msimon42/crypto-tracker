class AssetsController < ApplicationController
  def index
    assets = AssetApi.get_all
    @paginatable_assets = Kaminari.paginate_array(assets).page(params[:page]).per(100)
  end

  def show
    @asset = AssetApi.get(params[:name]).first
  end
end
