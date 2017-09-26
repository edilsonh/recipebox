class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  def new
    @ingredient = Ingredient.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.ingredients.create(ingredient_params)
    redirect_to recipe_path(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :unit_of_measurement, :recipe_id)
  end
end
