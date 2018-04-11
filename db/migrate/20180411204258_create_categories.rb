class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, limit: 100, null: false
      t.references :parent, foreign_key: { to_table: :categories }

      t.timestamps
    end
    add_index :categories, :name
    add_index :categories, [:name, :parent_id], unique: true
  end
end
