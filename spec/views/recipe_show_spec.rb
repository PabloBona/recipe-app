require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { TestConfiguration.create_example_user }
  let(:recipe) { create(:recipe, user_id: user.id) }

  before do
    sign_in user
    assign(:recipe, recipe)
    render
  end

  it "Should render recipe's name" do
    expect(rendered).to match(/#{recipe.name}/)
  end

  it 'Should render recipe information' do
    expect(rendered).to have_text("Preparation time: #{recipe.preparation_time}")
    expect(rendered).to have_text("Cooking time: #{recipe.cooking_time}")
    expect(rendered).to have_text(recipe.description)
  end

  it 'Should render a button to make the recipe public or not' do
    expect(rendered).to have_text('Public')
  end

  it 'renders a table with food details' do
    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('th', text: 'Food')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Value')
    expect(rendered).to have_selector('th', text: 'Actions')
  end
end
