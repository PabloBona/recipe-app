require 'rails_helper'

RSpec.describe 'general_shopping_lists/index', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestConfiguration.create_example_user }
  let(:food) { Food.create(name: 'Cherry', measurement_unit: 'kg', price: '12', quantity: 2, user_id: user.id) }
  let(:recipe) { create(:recipe, preparation_time: 1, cooking_time: 1, description: 'Steps here...') }
  let(:recipe_food) { RecipeFood.create(quantity: 5, recipe_id: recipe.id, food_id: food.id) }
  let(:shopping) { {food.id => {name: food.name, quantity: 3, total_price: 36 }} }
  
  before do
    sign_in user
    assign(:recipes, recipe)
    assign(:required_foods, food)
    assign(:shopping_list, shopping)
    render
  end

  it 'Should render correct title' do
    expect(rendered).to have_text('General Shopping List')
  end

  it 'should render the amount od food' do
    expect(rendered).to have_text('Amount of Food Item To Buy: 1')
  end

  it 'renders a table with shopping details' do
    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('th', text: 'Food')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Price')
    expect(rendered).to have_selector('td', text: 'Cherry')
    expect(rendered).to have_selector('td', text: '3')
    expect(rendered).to have_selector('td', text: '36')
  end
end
