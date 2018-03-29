class AddPrimaryKeyToStoresWines < ActiveRecord::Migration[5.1]
  def change
    add_column :stores_wines, :id, :primary_key
  end
end
