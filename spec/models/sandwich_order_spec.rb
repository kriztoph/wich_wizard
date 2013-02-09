require 'spec_helper'

describe SandwichOrder do
  it { should have_many(:sandwich_ingredients).through(:sandwich_order_ingredients) }
  it { should have_many :sandwich_order_ingredients }
  it { should belong_to :user }

  describe "ingredients_by_category(category)" do
    it "returns sandwich ingredients by category" do
      turkey = create(:sandwich_ingredient, :category => "Meat", :ingredient => "Turkey")
      tomato = create(:sandwich_ingredient, :category => "Veggies", :ingredient => "Tomato")
      lettuce = create(:sandwich_ingredient, :category => "Veggies", :ingredient => "Lettuce")
      mustard = create(:sandwich_ingredient, :category => "Condiment", :ingredient => "Mustard")
      order = build(:sandwich_order)
      order.sandwich_order_ingredients << SandwichOrderIngredient.new(:sandwich_ingredient_id => turkey.id)
      order.sandwich_order_ingredients << SandwichOrderIngredient.new(:sandwich_ingredient_id => tomato.id)
      order.sandwich_order_ingredients << SandwichOrderIngredient.new(:sandwich_ingredient_id => lettuce.id)
      order.sandwich_order_ingredients << SandwichOrderIngredient.new(:sandwich_ingredient_id => mustard.id)

      order.save

      order.ingredients_by_category("Meat").should eq([turkey])
      order.ingredients_by_category("Veggies").should eq([tomato, lettuce])
      order.ingredients_by_category("Condiment").should eq([mustard])
    end
  end
end


