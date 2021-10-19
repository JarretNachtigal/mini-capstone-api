class ChangeNumInInventory < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :num_in_inventory, :integer, default: 0
  end
end
