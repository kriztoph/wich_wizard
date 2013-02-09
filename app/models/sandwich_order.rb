class SandwichOrder < ActiveRecord::Base
  attr_accessible :orderer_name, :user_id

  has_many :sandwich_ingredients, :through => :sandwich_order_ingredients
  has_many :sandwich_order_ingredients

  belongs_to :user

  def ingredients_by_category(category)
    self.sandwich_ingredients.where(:category => category)
  end
end
