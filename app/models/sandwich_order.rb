class SandwichOrder < ActiveRecord::Base
  attr_accessible :orderer_name

  has_many :sandwich_ingredients, :through => :sandwich_order_ingredients
  has_many :sandwich_order_ingredients

  def ingredients_by_category(category)
    self.sandwich_ingredients.where(:category => category)
  end
end
