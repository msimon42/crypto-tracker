class PriceChange
  attr_reader :one_d,
              :seven_d,
              :thirty_d,
              :one_y

  def initialize(data)
    @data = data
    @one_d = data['1d']['price_change'] || 0
    @seven_d = data['7d']['price_change'] || 0
    @thirty_d = data['30d']['price_change'] || 0
    @one_y = data['365d']['price_change'] || 0
    @ytd = data['ytd']['price_change'] || 0
    @volume = data['1d']['volume'] || 0  
  end
end
