class RemoveInventory < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :inventory
  end
end
