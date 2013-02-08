require 'spec_helper'

describe "sandwich_ingredients/edit" do
  before(:each) do
    @sandwich_ingredient = assign(:sandwich_ingredient, stub_model(SandwichIngredient,
      :category => "MyString",
      :ingredient => "MyString"
    ))
  end

  it "renders the edit sandwich_ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sandwich_ingredients_path(@sandwich_ingredient), :method => "post" do
      assert_select "input#sandwich_ingredient_category", :name => "sandwich_ingredient[category]"
      assert_select "input#sandwich_ingredient_ingredient", :name => "sandwich_ingredient[ingredient]"
    end
  end
end
