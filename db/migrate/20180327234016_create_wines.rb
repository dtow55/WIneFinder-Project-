class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :type
      t.string :grape
    end
  end
end
