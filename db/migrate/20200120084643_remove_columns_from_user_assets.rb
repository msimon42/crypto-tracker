class RemoveColumnsFromUserAssets < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_assets, :amount
    remove_column :user_assets, :cost_basis
  end
end
