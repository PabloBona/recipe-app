require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  let(:user) { TestConfiguration.create_example_user }
  let(:recipe) { create(:recipe, preparation_time: 1, cooking_time: 1, description: 'Steps here...') }

  describe 'GET Recipe#index' do
    before do
      sign_in user
      get '/recipes'
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/index' do
      expect(response).to render_template('recipes/index')
    end

    it 'Body shlud include recipe name' do
      expect(response.body).to include("#{user.name}'s Recipes")
    end
  end

  describe 'GET Recipe#new' do
    before do
      sign_in user
      get '/recipes/new'
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/new' do
      expect(response).to render_template('recipes/new')
    end

    it 'Body shlud include recipe information' do
      expect(response.body).to include('Create new recipe')
    end
  end

  describe 'GET Recipe#show' do
    before do
      sign_in user
      get "/recipes/#{recipe.id}"
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template recipe/show' do
      expect(response).to render_template('recipes/show')
    end

    it 'Body shlud include recipe information' do
      expect(response.body).to include(recipe.name)
    end
  end
end
