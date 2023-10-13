class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, :foods, :recipe_foods).where(public: true).order(created_at: :desc)
  end
end
