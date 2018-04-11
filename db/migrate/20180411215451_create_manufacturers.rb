class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name, limit: 100, null: false

      t.timestamps
    end
    add_index :manufacturers, :name, unique: true
  end
end
