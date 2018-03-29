class AddInventoryToStoresWines < ActiveRecord::Migration[5.1]
  def change
    add_column :stores_wines, :inventory, :integer
  end
end
