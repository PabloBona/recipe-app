class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    RecipeFood.where(recipe_id: @recipe).delete_all

    return unless @recipe.destroy

    redirect_to recipes_path
  end
end
