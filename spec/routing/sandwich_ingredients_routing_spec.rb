require "spec_helper"

describe SandwichIngredientsController do
  describe "routing" do

    it "routes to #index" do
      get("/sandwich_ingredients").should route_to("sandwich_ingredients#index")
    end

    it "routes to #new" do
      get("/sandwich_ingredients/new").should route_to("sandwich_ingredients#new")
    end

    it "routes to #show" do
      get("/sandwich_ingredients/1").should route_to("sandwich_ingredients#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sandwich_ingredients/1/edit").should route_to("sandwich_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sandwich_ingredients").should route_to("sandwich_ingredients#create")
    end

    it "routes to #update" do
      put("/sandwich_ingredients/1").should route_to("sandwich_ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sandwich_ingredients/1").should route_to("sandwich_ingredients#destroy", :id => "1")
    end

  end
end
