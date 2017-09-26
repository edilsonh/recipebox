class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.text :details
      t.integer :recipe_id

      t.timestamps
    end
    add_index :steps, :recipe_id
  end
end
