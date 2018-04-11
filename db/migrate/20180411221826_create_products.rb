class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true, null: false
      t.integer :external_id, null: false
      t.string :name, limit: 100
      t.references :manufacturer, foreign_key: true, null: false
      t.string :manufacturer_code, limit: 100
      t.string :ean, limit: 100
      t.decimal :price, precision: 12, scale: 2, null: false

      t.timestamps
    end
    add_index :products, :external_id, unique: true
    add_index :products, :name
    add_index :products, :manufacturer_code
    add_index :products, :price
  end
end
