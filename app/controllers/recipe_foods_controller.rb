class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food_list = current_user.foods
    @recipe = Recipe.find(params[:id])

    @foods = filter_foods(@recipe, @food_list)

    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    recipe_food = RecipeFood.new(recipe_food_params)
    if recipe_food.save
      redirect_to new_recipe_food_path(recipe_food.recipe_id)
    else
      render :new
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @food = Food.find(@recipe_food.food_id)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    return unless @recipe_food.update(update_params)

    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.where(food_id: params[:id])
    recipe = Recipe.where(id: @recipe_food[0].recipe_id)
    return unless @recipe_food.delete_all

    redirect_to recipe_path(recipe[0].id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end

  def filter_foods(recipe, foods)
    recipe_food_ids = RecipeFood.where(recipe_id: recipe.id).pluck(:food_id)

    foods.reject { |food| recipe_food_ids.include?(food.id) }
  end

  def update_params
    params.require(:recipe_food).permit(:quantity)
  end
end
