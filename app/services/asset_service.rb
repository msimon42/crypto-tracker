require 'net/http'

class AssetService
  def get_all
    json_parse('v1/currencies/ticker', nil)
  end

  def get(asset)
    params = {ids: asset}
    json_parse('v1/currencies/ticker', params)
  end

  def get_multiple(assets)
    params = {ids: assets.join('%2C')}
    json_parse('v1/currencies/ticker', params)
  end

  def get_metadata(asset)
    params = {ids: asset}
    json_parse('v1/currencies', params)
  end

  private

    def conn
      Faraday.new(url: 'https://api.nomics.com') do |f|
        f.adapter Faraday.default_adapter
        f.params[:key] = ENV['NOMICS_KEY']
      end
    end

    def json_parse(url, params)
      response = conn.get(url, params)
      JSON.parse(response.body)
    end
end
