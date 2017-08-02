require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }
  describe 'GET#welcome' do
    it 'template rendering action' do
      get :welcome
      expect(response).to render_template :welcome
    end
  end
end
