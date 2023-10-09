# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!
end
