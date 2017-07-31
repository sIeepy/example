require 'rails_helper'

RSpec.describe MicropostsController do
  let(:user) { create(:user) }


  before { sign_in user }

  describe 'GET#show' do
    let(:micropost) { create(:micropost) }
    it 'template rendering action' do
      get :show, params: { id: micropost.id }
      expect(response).to have_http_status(:success)
      response.should render_template(:show)
    end
  end

  describe 'GET#index' do
    it 'template rendering action' do
      get :index
      response.should render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'template rendering action' do
      get :new
      response.should render_template(:new)
    end
  end

  describe 'POST#create' do
    context 'with valid attributes' do
      it 'creates new micropost' do
        expect {
          post :create, params: { micropost: FactoryGirl.attributes_for(:micropost) }
        }.to change(Micropost, :count).by(1)
      end

      it 'flashes info' do
        post :create, params: { micropost: FactoryGirl.attributes_for(:micropost) }
        expect(flash[:notice]).to eq I18n.t('shared.created', resource: 'Micropost')
      end

      it 'redirects to the new contact' do
        post :create, params: { micropost: FactoryGirl.attributes_for(:micropost) }
        response.should redirect_to microposts_path
      end
    end

    context 'with invalid attributes' do
      it 'does not create new micropost' do
        expect{
          post :create, params: { micropost: FactoryGirl.attributes_for(:micropost_invalid) }
        }.to_not change(Micropost, :count)
      end

      it 'rerenders new method' do
        post :create, params: { micropost: FactoryGirl.attributes_for(:micropost_invalid) }
        get :new
        response.should render_template(:new)
      end
    end
  end

  describe 'DELETE#destroy' do
    let!(:micropost) { create(:micropost) }
    it 'delete micropost' do
      expect{
        delete :destroy, params: { id: micropost.id }
      }.to change(Micropost, :count).by(-1)
    end

    it 'flashes info' do
      delete :destroy, params: { id: micropost.id }
      expect(flash[:notice]).to eq I18n.t('shared.deleted', resource: 'Student')
    end

    it 'redirects to the microposts' do
      delete :destroy, params: { id: micropost.id }
      response.should redirect_to microposts_path
    end
  end
end
