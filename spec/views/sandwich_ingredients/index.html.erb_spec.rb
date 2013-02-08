require 'spec_helper'

describe "sandwich_ingredients/index" do
  before(:each) do
    assign(:sandwich_ingredients, [
      stub_model(SandwichIngredient,
        :category => "Category",
        :ingredient => "Ingredient"
      ),
      stub_model(SandwichIngredient,
        :category => "Category",
        :ingredient => "Ingredient"
      )
    ])
  end

  it "renders a list of sandwich_ingredients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Ingredient".to_s, :count => 2
  end
end
