class AddNumProductsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :num_in_inventory, :integer
  end
end
