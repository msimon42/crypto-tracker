class AssetFacade
  attr_reader :price,
              :circulating_supply,
              :max_supply,
              :market_cap,
              :ath,
              :price_changes

  def initialize(symbol)
    @data = AssetService.new.get(symbol).first
    @price = @data['price']
    @circulating_supply = @data['circulating_supply']
    @max_supply = @data['max_supply']
    @market_cap = @data['market_cap']
    @ath = @data['high']
    @price_changes = PriceChange.new(@data)
  end 
end
