require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { TestConfiguration.create_example_user }
  let(:food) { create(:food) }
  let(:food_with_custom_values) { create(:food_with_price_and_quantity, price: 5, quantity: 10) }
  describe 'Associations' do
    it { should have_many(:recipe_foods).dependent(:destroy) }
    it { should have_many(:recipes).through(:recipe_foods) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:measurement_unit) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity) }
  end
end
