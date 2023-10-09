class RecipesController < ApplicationController
  before_action :authenticate_user!
end
