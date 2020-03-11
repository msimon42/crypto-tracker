class PriceChange
  attr_reader :one_d,
              :one_d_pct,
              :seven_d,
              :seven_d_pct,
              :thirty_d,
              :thirty_d_pct,
              :one_y,
              :one_y_pct,
              :ytd,
              :ytd_pct,
              :volume

  def initialize(data)
    @data = data
    @one_d = data['1d']['price_change'] || 0
    @one_d_pct = data['1d']['price_change_pct'] || 0
    @seven_d = data['7d']['price_change'] || 0
    @seven_d_pct = data['7d']['price_change_pct'] || 0
    @thirty_d = data['30d']['price_change'] || 0
    @thirty_d_pct = data['30d']['price_change_pct'] || 0
    @one_y = data['365d']['price_change'] || 0
    @one_y_pct = data['365d']['price_change_pct'] || 0
    @ytd = data['ytd']['price_change'] || 0
    @ytd_pct = data['ytd']['price_change_pct'] || 0
    @volume = data['1d']['volume'] || 0
  end
end
