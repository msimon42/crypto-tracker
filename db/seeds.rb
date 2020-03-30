# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trade.destroy_all
UserAsset.destroy_all
User.destroy_all
Asset.destroy_all
assets = AssetService.new.get_all
assets.each do |asset|
  Asset.create(symbol: asset['id'], name: asset['name'].upcase)
end
