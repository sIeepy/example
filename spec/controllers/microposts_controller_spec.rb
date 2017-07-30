require 'rails_helper'

RSpec.describe MicropostsController do
  let(:user) { create(:user) }


  before { sign_in user }

  describe 'GET#show' do
    let(:micropost) { create(:micropost) }
    it "returns http success" do
      get :show, params: { id: micropost.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET#index" do
    it "returns http success" do
      get :index
    end
  end
  describe 'POST #create' do
    context 'success' do
      let!(:params) { attributes_for(:micropost) }

      it 'success' do
        expect(response).to be_success
      end

      it 'flashes info' do
        post :create, params
        expect(flash[:notice]).to eq I18n.t('shared.created', resource: 'Micropost')
      end

      it 'creates micropost' do
        expect{ post :create, params }.to change(Micropost, :count).by(1)
      end
    end
  end
end
