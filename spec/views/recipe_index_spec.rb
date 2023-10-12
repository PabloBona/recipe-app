require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestConfiguration.create_example_user }
  let(:recipe) { create(:recipe, preparation_time: 1, cooking_time: 1, description: 'Steps here...') }

  before do
    assign(:user, user)
    assign(:recipes, [recipe])
    render
  end

  it "Should render user and recipe's name" do
    expect(rendered).to match(/#{user.name}'s Recipes/)
    expect(rendered).to match(/Recipe Ex1/)
  end

  it 'Should render recipe description' do
    expect(rendered).to have_text(recipe.description)
  end

  it 'Should render create new recipe button' do
    expect(rendered).to have_text('Create new recipe')
  end
end
