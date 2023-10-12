require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestConfiguration.create_example_user }

  before do
    sign_in user
    assign(:user, user)
    assign(:new_recipe, user.recipes.new)
    render
  end

  it 'Should render the correct title' do
    expect(rendered).to match(/Create new recipe/)
  end

  it 'Should render name label and input' do
    expect(rendered).to have_selector('label', text: "Recipe's name:")
    expect(rendered).to have_selector('input', id: 'recipe_name')
  end

  it 'Should render preparation time label and input' do
    expect(rendered).to have_selector('label', text: 'Preparation time(hrs):')
    expect(rendered).to have_selector('input', id: 'recipe_preparation_time')
  end

  it 'Should render cooking time label and input' do
    expect(rendered).to have_selector('label', text: 'Cooking time(hrs):')
    expect(rendered).to have_selector('input', id: 'recipe_cooking_time')
  end

  it 'Should render description label and input' do
    expect(rendered).to have_selector('label', text: 'Description:')
    expect(rendered).to have_selector('textarea', id: 'recipe_description')
  end

  it 'Should render submit and cancel buttons' do
    expect(rendered).to have_text('Create')
    expect(rendered).to have_selector('a', text: 'Cancel')
  end
end
