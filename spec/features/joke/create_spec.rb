require 'rails_helper'

feature 'User can create joke' do

  given(:user) { User.create!(email: 'user@mail.ru', password: '111111') }

  describe 'Authenticated user' do
    background do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      visit jokes_path
      click_on 'New joke'
    end

    scenario 'add a joke' do
      fill_in 'Title', with: 'Text'
      fill_in 'Body', with: 'text text text'

      click_on 'Submit joke!'

      expect(page).to have_content 'Joke created!'
      expect(page).to have_content 'Text'
      expect(page).to have_content 'text text text'
    end

    scenario 'add a joke with errors' do
      click_on 'Submit joke!'

      expect(page).to have_content "Title can't be blank"
    end

  end

  scenario 'Unregistered user tries to add a joke' do
    visit jokes_path

    expect(page).to_not have_content 'New joke'
  end

end