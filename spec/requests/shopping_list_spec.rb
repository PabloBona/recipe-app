require 'rails_helper'

RSpec.describe 'Shopping list', type: :request do
  let(:user) { TestConfiguration.create_example_user }
  let(:food) { create(:food, user:) }
  let(:recipe) { create(:recipe, preparation_time: 1, cooking_time: 1, description: 'Steps here...') }
  let(:recipe_food) { RecipeFood.create(quantity: 5, recipe_id: recipe.id, food_id: food.id) }

  describe 'GET shopping#index' do
    before do
      sign_in user
      get '/general_shopping_lists'
    end

    it 'Returns http success' do
      expect(response.status).to eq(200)
    end

    it 'Should render the template general_shopping_lists/index' do
      expect(response).to render_template('general_shopping_lists/index')
    end

    it 'Body should include correct title' do
      expect(response.body).to include('General Shopping List')
    end

    it 'Body should includ total amount of food and total value' do
      expect(response.body).to include('Amount of Food Item To Buy:')
      expect(response.body).to include('Total Value of Food Needed:')
    end

    it 'Body should include a table' do
      expect(response.body).to include('Food')
      expect(response.body).to include('Quantity')
      expect(response.body).to include('Price')
    end
  end
end
