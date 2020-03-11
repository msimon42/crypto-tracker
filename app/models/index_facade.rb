class IndexFacade
  attr_reader :logo,
              :rank,
              :name,
              :symbol,
              :price,
              :circulating_supply,
              :max_supply,
              :market_cap,
              :ath

  def initialize(asset)
    @logo = asset['logo_url']
    @rank = asset['rank']
    @name = asset['name']
    @symbol = asset['symbol']
    @price = asset['price']
    @circulating_supply = asset['circulating_supply']
    @max_supply = asset['max_supply']
    @market_cap = asset['market_cap']
    @ath = asset['ath']
  end

  def self.generate(data)
    data.map {|asset| self.new(asset)}
  end
end
