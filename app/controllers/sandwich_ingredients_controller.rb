class SandwichIngredientsController < ApplicationController
  # GET /sandwich_ingredients
  # GET /sandwich_ingredients.json
  def index
    @sandwich_ingredients = SandwichIngredient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sandwich_ingredients }
    end
  end

  # GET /sandwich_ingredients/1
  # GET /sandwich_ingredients/1.json
  def show
    @sandwich_ingredient = SandwichIngredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sandwich_ingredient }
    end
  end

  # GET /sandwich_ingredients/new
  # GET /sandwich_ingredients/new.json
  def new
    @sandwich_ingredient = SandwichIngredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sandwich_ingredient }
    end
  end

  # GET /sandwich_ingredients/1/edit
  def edit
    @sandwich_ingredient = SandwichIngredient.find(params[:id])
  end

  # POST /sandwich_ingredients
  # POST /sandwich_ingredients.json
  def create
    @sandwich_ingredient = SandwichIngredient.new(params[:sandwich_ingredient])

    respond_to do |format|
      if @sandwich_ingredient.save
        format.html { redirect_to @sandwich_ingredient, notice: 'Sandwich ingredient was successfully created.' }
        format.json { render json: @sandwich_ingredient, status: :created, location: @sandwich_ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @sandwich_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sandwich_ingredients/1
  # PUT /sandwich_ingredients/1.json
  def update
    @sandwich_ingredient = SandwichIngredient.find(params[:id])

    respond_to do |format|
      if @sandwich_ingredient.update_attributes(params[:sandwich_ingredient])
        format.html { redirect_to @sandwich_ingredient, notice: 'Sandwich ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sandwich_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sandwich_ingredients/1
  # DELETE /sandwich_ingredients/1.json
  def destroy
    @sandwich_ingredient = SandwichIngredient.find(params[:id])
    @sandwich_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to sandwich_ingredients_url }
      format.json { head :no_content }
    end
  end
end
