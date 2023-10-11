require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { TestConfiguration.create_example_user }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      food = create(:food, user:)
      get :show, params: { id: food.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new food with valid params' do
      expect do
        post :create, params: { food: attributes_for(:food) }
      end.to change(Food, :count).by(1)
      expect(response).to redirect_to(foods_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the food' do
      food = create(:food, user:)
      expect do
        delete :destroy, params: { id: food.id }
      end.to change(Food, :count).by(-1)
      expect(response).to redirect_to(foods_path)
    end
  end
end
