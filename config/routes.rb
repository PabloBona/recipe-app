# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :foods
  get 'recipe_foods/new/:id', to: 'recipe_foods#new', as: 'new_recipe_food'
  resources :recipe_foods
  resources :recipes
  resources :general_shopping_lists, only: [:index]
  resources :public_recipes, only: [:index]
  # Define any additional custom routes if needed
  
end
