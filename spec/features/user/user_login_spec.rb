require 'spec_helper'
require 'rails_helper'

feature 'User sign in and visit profile page' do
  let(:user) { create(:user) }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Edit'
    visit user_path(1)
  end
end
