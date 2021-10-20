class UpdateInventoryName < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :num_in_inventory, :inventory
  end
end
