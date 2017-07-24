require 'spec_helper'
require 'rails_helper'

feature 'Registration' do
  scenario 'User creates a new account' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'jan@wp.pl'
    fill_in 'Name', with: 'janek'
    fill_in 'Password', with: '11111111'
    fill_in 'Password confirmation', with: '11111111'
    click_button 'Sign up'
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end
end
