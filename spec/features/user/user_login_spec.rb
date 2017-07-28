require 'spec_helper'
require 'rails_helper'

feature 'User sign in and visit profile page' do
  let(:user) { create(:user) }
  
  before(:each) do
    sign_in user
    visit users_path
  end

  background do
    sign_in
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Profile'
    visit user_path(1)
  end
end
