class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @foods_list = RecipeFood.where(recipe_id: @recipe)

    RecipeFood.where(recipe_id: @recipe).delete_all

    @foods_list.each do |food|
      Food.where(id: food.food_id).delete_all
    end

    return unless @recipe.destroy

    redirect_to recipes_path
  end
end
