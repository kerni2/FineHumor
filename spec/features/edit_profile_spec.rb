require 'rails_helper'

feature 'User can edit profile', %q{
  In order to edit profile
  As an authinticated user
  I'd like to be able to edit email or password
} do

  given(:user) { create(:user) }

  describe 'Registered user' do
    background do
      sign_in(user)
      visit edit_user_registration_path
    end

    scenario 'edit email' do
      fill_in 'Email', with: 'new-email@mail.ru'
      fill_in 'Current password', with: user.password
      click_on 'Update'

      expect(page).to have_content 'Your account has been updated successfully'
    end

    scenario 'edit password' do
      fill_in 'Password', with: 'newpassword'
      fill_in 'Password confirmation', with: 'newpassword'
      fill_in 'Current password', with: user.password
      click_on 'Update'

      expect(page).to have_content 'Your account has been updated successfully'
    end
  end
end
