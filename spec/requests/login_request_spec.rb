require 'rails_helper'

RSpec.describe 'Login page', type: :request do
  describe 'GET users/sign_in' do
    before do
      get '/users/sign_in'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should render the template devise/sessions/new' do
      expect(response).to render_template('devise/sessions/new')
    end

    it 'Body should include "Loog In" text' do
      expect(response.body).to include('Log In')
    end
  end
end
