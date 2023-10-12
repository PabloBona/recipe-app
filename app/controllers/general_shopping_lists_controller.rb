class GeneralShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.includes(:foods, :recipe_foods).all
    @remaining_stock = calculate_remaining_stock(@recipes)
    @total_quantity = calculate_total_quantity(@recipes)
    @total_price = calculate_total_price(@recipes, @remaining_stock)
  end

  private

  def calculate_stock_food_price(recipes)
    stock_food_price = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food = Food.find_by(id: recipe_food.food_id)
        stock_food_price += food.price * food.quantity if food
      end
    end
    stock_food_price
  end

  def calculate_total_quantity(recipes)
    total_quantity = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        total_quantity += recipe_food.quantity
      end
    end
    total_quantity
  end

  def calculate_total_price(recipes, remaining_stock)
    total_price = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food = Food.find_by(id: recipe_food.food_id)
        next unless food

        required_quantity = recipe_food.quantity
        available_quantity = [required_quantity, remaining_stock[food.name]].min
        total_price += food.price * available_quantity
      end
    end
    total_price
  end

  def calculate_remaining_stock(recipes)
    remaining_stock = {}

    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food = Food.find_by(id: recipe_food.food_id)
        next unless food

        required_quantity = recipe_food.quantity
        available_quantity = food.quantity
        remaining_stock[food.name] = required_quantity - available_quantity if available_quantity < required_quantity
      end
    end

    remaining_stock
  end
end
