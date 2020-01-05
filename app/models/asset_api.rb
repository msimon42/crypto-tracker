require 'net/http'

class AssetApi
  def self.get_all
    uri = URI("https://api.nomics.com/v1/currencies/ticker?key=2595a8427418356ea4954a8c2f0d2782")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.get(asset)
    uri = URI("https://api.nomics.com/v1/currencies/ticker?key=2595a8427418356ea4954a8c2f0d2782&ids=#{asset}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.get_multiple(assets)
    api_query = assets.join('%2C')
    uri = URI("https://api.nomics.com/v1/currencies/ticker?key=2595a8427418356ea4954a8c2f0d2782&ids=#{api_query}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.get_metadata(asset)
    uri = URI("https://api.nomics.com/v1/currencies?key=2595a8427418356ea4954a8c2f0d2782&ids=#{asset}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
