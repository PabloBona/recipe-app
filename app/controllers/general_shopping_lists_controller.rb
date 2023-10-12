class GeneralShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.includes(:foods).all
  end
end
