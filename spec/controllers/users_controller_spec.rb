require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET#index' do
    it 'template rendering action' do
      sign_in user
      get :index
      response.should render_template(:index)
    end
  end
end
