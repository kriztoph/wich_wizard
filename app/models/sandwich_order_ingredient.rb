class SandwichOrderIngredient < ActiveRecord::Base
  attr_accessible :sandwich_ingredient_id

  belongs_to :sandwich_order
  belongs_to :sandwich_ingredient
end
