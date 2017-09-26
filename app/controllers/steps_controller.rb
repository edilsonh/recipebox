class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  def new
    @step = Step.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.steps.create(step_params)
    redirect_to recipe_path(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to recipe_path(@recipe), notice: 'Step was successfully updated!' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit}
        format.json {render json: @step.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @step.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:details, :recipe_id)
  end
end
