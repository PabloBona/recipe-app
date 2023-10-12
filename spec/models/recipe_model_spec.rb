require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { TestConfiguration.create_example_user }
  let(:valid_recipe) { create(:recipe, preparation_time: 1, cooking_time: 1, description: 'Steps here...') }

  describe 'Validations' do
    it 'Name has to be present to be valid' do
      expect(build(:recipe, name: '', user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'Preparation time has to be interger greater than 0' do
      expect(build(:recipe, preparation_time: 0, user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, preparation_time: -5, user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, preparation_time: 1.5, user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'Cooking time has to be interger greater than 0' do
      expect(build(:recipe, cooking_time: 0, user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, cooking_time: -5, user_id: user.id, public: true)).not_to be_valid
      expect(build(:recipe, cooking_time: 1.5, user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'Description has to be present to be valid' do
      expect(build(:recipe, description: '', user_id: user.id, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end

    it 'User_id has to be present to be valid' do
      expect(build(:recipe, public: true)).not_to be_valid
      expect(valid_recipe).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
  end
end
