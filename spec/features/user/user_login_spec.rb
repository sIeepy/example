require 'spec_helper'
require 'rails_helper'

feature 'User sign in and visit profile page' do
  scenario 'User log in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'jan@wp.pl'
    fill_in 'Password', with: '11111111'
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

  background do
    sign_in
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Profile'
    visit user_path
  end
end
