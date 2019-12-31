class AssetsController < ApplicationController
  def index
    @assets = AssetApi.get_all
  end
end
