class RenameType < ActiveRecord::Migration[5.1]
  def change
    rename_column :trades, :type, :transaction_type
  end
end
