require 'spec_helper'

describe "sandwich_ingredients/new" do
  before(:each) do
    assign(:sandwich_ingredient, stub_model(SandwichIngredient,
      :category => "MyString",
      :ingredient => "MyString"
    ).as_new_record)
  end

  it "renders new sandwich_ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sandwich_ingredients_path, :method => "post" do
      assert_select "input#sandwich_ingredient_category", :name => "sandwich_ingredient[category]"
      assert_select "input#sandwich_ingredient_ingredient", :name => "sandwich_ingredient[ingredient]"
    end
  end
end
