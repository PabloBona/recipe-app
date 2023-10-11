require 'rails_helper'

RSpec.describe 'public_recipes/index', type: :view do
  let(:user) { TestConfiguration.create_example_user }

  before do
    assign(:recipes, [])
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it 'renders a message when there are no public recipes' do
    expect(rendered).to match(/There is no public recipe./)
  end

  it 'renders public recipes when there are recipes' do
    recipe = create(:recipe, public: true, preparation_time: 1, cooking_time: 1, description: 'Test', user:)
    assign(:recipes, [recipe])
    render

    expect(rendered).to have_selector('.bg-warning-subtle')
    expect(rendered).to have_link(recipe.name, href: recipe_path(recipe.id))
    expect(rendered).to have_content("By: #{recipe.user.name}")
  end
end
