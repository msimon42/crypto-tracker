class AssetsController < ApplicationController
  def index
    assets = IndexFacade.generate(AssetService.new.get_all)
    @paginatable_assets = Kaminari.paginate_array(assets).page(params[:page]).per(100)
  end

  def show
    @asset = AssetFacade.new(params[:name])
  end
end
