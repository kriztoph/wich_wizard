class CreateSandwichIngredients < ActiveRecord::Migration
  def change
    create_table :sandwich_ingredients do |t|
      t.string :category
      t.string :ingredient

      t.timestamps
    end
  end
end
