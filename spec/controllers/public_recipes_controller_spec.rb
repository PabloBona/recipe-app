require 'rails_helper'

RSpec.describe PublicRecipesController, type: :controller do
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

  it 'assigns an empty array to @recipes if there are no public recipes' do
    get :index
    expect(assigns(:recipes)).to be_empty
  end
end
