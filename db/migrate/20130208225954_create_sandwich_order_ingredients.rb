class CreateSandwichOrderIngredients < ActiveRecord::Migration
  def change
    create_table :sandwich_order_ingredients do |t|
      t.integer :sandwich_order_id
      t.integer :sandwich_ingredient_id
      t.timestamps
    end
  end
end
