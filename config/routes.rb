# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :foods
  resources :recipe_foods
  resources :recipes

  # Define any additional custom routes if needed
end
