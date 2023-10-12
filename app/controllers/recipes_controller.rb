class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    return unless @recipe.update(update_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe

    return unless @recipe.destroy

    RecipeFood.where(recipe_id: @recipe).delete_all

    redirect_to recipes_path
  end

  def new
    @user = current_user
    @new_recipe = @user.recipes.new
  end

  def create
    recipe = current_user.recipes.new(recipes_params)
    if recipe.save
      redirect_to recipe_path(recipe.id)
    else
      render :new
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def update_params
    params.require(:recipe).permit(:public)
  end
end
