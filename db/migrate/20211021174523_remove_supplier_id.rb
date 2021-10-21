class RemoveSupplierId < ActiveRecord::Migration[6.1]
  def change
    remove_column :suppliers, :supplier_id, :integer
  end
end
