class AssetFacade
  attr_reader :price,
              :circulating_supply,
              :max_supply,
              :market_cap,
              :ath,
              :price_changes,
              :reddit_url,
              :github_url,
              :telegram_url,
              :website_url,
              :ath_date

  def initialize(symbol)
    @data = AssetService.new.get(symbol).first
    @metadata = AssetService.new.get_metadata(symbol).first
    @price = @data['price']
    @circulating_supply = @data['circulating_supply']
    @max_supply = @data['max_supply']
    @market_cap = @data['market_cap']
    @ath = @data['high']
    @ath_date = @data['high_timestamp']
    @price_changes = PriceChange.new(@data)
    @reddit_url = @metadata['reddit_url']
    @github_url = @metadata['github_url']
    @telegram_url = @metadata['telegram_url']
    @website_url = @metadata['website_url']
  end
end
