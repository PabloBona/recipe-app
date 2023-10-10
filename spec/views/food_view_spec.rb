require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  let(:user) { TestConfiguration.create_example_user }

  before do
    assign(:user, user)
    assign(:foods, [Food.new(name: "Pizza", measurement_unit: "Slice", price: 10, quantity: 2)])
    render
  end

  it "renders user's name and food list" do
    expect(rendered).to match(/#{user.name}'s Food/)
    expect(rendered).to match(/Food List/)
  end

  it "renders a table with food details" do
    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('th.food-name', text: 'Name')
    expect(rendered).to have_selector('th', text: 'Measurement Unit')
    expect(rendered).to have_selector('th', text: 'Unit Price')
    expect(rendered).to have_selector('th', text: 'Quantity')
    expect(rendered).to have_selector('th', text: 'Actions')
    expect(rendered).to have_selector('td', text: 'Pizza')
    expect(rendered).to have_selector('td', text: 'Slice')
    expect(rendered).to have_selector('td', text: '$ 10')
    expect(rendered).to have_selector('td', text: '2')
  end

  it "renders Add New Food button" do
    expect(rendered).to have_selector('a.btn.btn-primary', text: 'Add New Food')
  end
end
