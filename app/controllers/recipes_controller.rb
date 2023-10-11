class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
    @foods = []
    @recipe_foods.each { |recipe_food| @foods << Food.where(id: recipe_food.food_id) }
    @food_details = new_recipe_foods_object(@foods, @recipe_foods)
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
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end

  def update_params
    params.require(:recipe).permit(:public)
  end

  def new_recipe_foods_object(foods, recipe_foods)
    new_foods = []
    foods.each do |food|
      recipe = recipe_foods.filter { |elem| elem.food_id == food[0].id }
      item = {food: food[0], recipe: recipe[0]}
      new_foods << item
    end
    new_foods
  end
end
