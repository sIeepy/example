require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET#index' do
    it 'template rendering action' do
      sign_in user
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET#show' do
    it 'template rendering action' do
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to render_template :show
    end
  end
end
