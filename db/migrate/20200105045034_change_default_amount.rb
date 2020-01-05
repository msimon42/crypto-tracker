class ChangeDefaultAmount < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:user_assets, :amount, 0.00)
  end
end
