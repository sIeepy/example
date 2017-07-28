require 'rails_helper'

feature 'User sign in and visit micropost' do
  background do
    sign_in
    visit microposts_path
  end

  scenario 'only when sign in' do
    logout
    visit microposts_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
