require 'spec_helper'

describe "sandwich_ingredients/show" do
  before(:each) do
    @sandwich_ingredient = assign(:sandwich_ingredient, stub_model(SandwichIngredient,
      :category => "Category",
      :ingredient => "Ingredient"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
    rendered.should match(/Ingredient/)
  end
end
