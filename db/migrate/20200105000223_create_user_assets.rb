class CreateUserAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :user_assets do |t|
      t.references :user, foreign_key: true
      t.references :asset, foreign_key: true
      t.float :amount
      t.timestamps
    end
  end
end
