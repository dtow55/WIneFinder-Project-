class CreateStoreWines < ActiveRecord::Migration[5.1]
  def change
    create_join_table :stores, :wines do |t|
      t.integer :store_id
      t.integer :wine_id
    end
  end
end
