require 'net/http'

class AssetService
  def get_all
    # uri = URI("https://api.nomics.com/v1/currencies/ticker?key=#{ENV['NOMICS_KEY']}")
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    json_parse('v1/currencies/ticker')
  end

  def get(asset)
    # uri = URI("https://api.nomics.com/v1/currencies/ticker?key=2595a8427418356ea4954a8c2f0d2782&ids=#{asset}")
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    params = {ids: asset}
    json_parse('v1/currencies/ticker', params)
  end

  def get_multiple(assets)
    # api_query = assets.join('%2C')
    # uri = URI("https://api.nomics.com/v1/currencies/ticker?key=2595a8427418356ea4954a8c2f0d2782&ids=#{api_query}")
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    params = {ids: assets.join('%2C')}
    json_parse('v1/currencies/ticker', params)
  end

  def get_metadata(asset)
    # uri = URI("https://api.nomics.com/v1/currencies?key=2595a8427418356ea4954a8c2f0d2782&ids=#{asset}")
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    params = {ids: asset}
    json_parse('v1/currencies', params)
  end

  private

    def conn
      Faraday.new(url: 'https://api.nomics.com') do |f|
        f.adapter = Faraday.default_adapter
        f.params[:key] = ENV['NOMICS_KEY']
      end
    end

    def json_parse
      response = conn.get(url, params=nil)
      JSON.parse(response.body)
    end
end
