class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.float :amount
      t.integer :type
      t.float :price_per_coin
      t.references :user_asset, foreign_key: true
      t.timestamps
    end
  end
end
