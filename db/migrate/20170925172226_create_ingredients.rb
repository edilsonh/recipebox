class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :unit_of_measurement
      t.references :recipe

      t.timestamps
    end
    add_foreign_key :ingredients, :recipes, on_delete: :cascade
  end
end
