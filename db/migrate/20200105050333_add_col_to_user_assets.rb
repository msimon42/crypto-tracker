class AddColToUserAssets < ActiveRecord::Migration[5.1]
  def change
    add_column(:user_assets, :cost_basis, :float, default: 0.00)
  end
end
