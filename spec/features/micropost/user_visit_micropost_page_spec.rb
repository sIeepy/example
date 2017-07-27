require 'spec_helper'
require 'rails_helper'

feature 'User sign in and visit micropost' do
  background do
    visit '/users/sign_in'
    fill_in 'Email', with: 'jan@wp.pl'
    fill_in 'Password', with: '11111111'
    click_button 'Log in'
    visit microposts_path
  end

  # scenario 'should see students list' do
  #   expect(page).to have_content 'Jan'
  #   expect(page).to have_content 'Adam'
  # end

  scenario 'only when sign in' do
    logout
    visit microposts_path
    binding.pry
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
