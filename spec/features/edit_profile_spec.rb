# frozen_string_literal: true

require 'rails_helper'

describe 'User can edit profile' do
  let(:user) { create(:user) }

  describe 'Registered user' do
    before do
      sign_in(user)
      visit edit_user_registration_path
    end

    it 'edit email' do
      fill_in 'Email', with: 'new-email@mail.ru'
      fill_in 'Current password', with: user.password
      click_on 'Update'

      expect(page).to have_content 'Your account has been updated successfully'
    end

    it 'edit password' do
      fill_in 'Password', with: 'newpassword'
      fill_in 'Password confirmation', with: 'newpassword'
      fill_in 'Current password', with: user.password
      click_on 'Update'

      expect(page).to have_content 'Your account has been updated successfully'
    end
  end
end
