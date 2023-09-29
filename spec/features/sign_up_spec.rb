require 'rails_helper'

feature 'User can sign up', %q{
  In order to add joke
  As an unregistered user
  I'd like to be able to sign up
} do

  background { visit new_user_registration_path }

  scenario 'Unregistered user tries to sign up' do
    fill_in 'Email', with: 'user@mail.ru'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Registered user tries to sign up' do
    User.create!(email: 'user@mail.ru', password: '111111')

    fill_in 'Email', with: 'user@mail.ru'
    fill_in 'Password', with: '111111'
    fill_in 'Password confirmation', with: '111111'
    click_on 'Sign up'

    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'Unregistered user tries to sign up with invalid attributes' do
    fill_in 'Email', with: 'usermail.ru'
    fill_in 'Password', with: '123'
    click_on 'Sign up'

    expect(page).to have_content 'Email is invalid'
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to have_content "Password is too short (minimum is 6 characters)"
  end
end
