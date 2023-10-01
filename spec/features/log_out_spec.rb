# frozen_string_literal: true

require 'rails_helper'

describe 'User can log out' do
  let(:user) { create(:user) }

  it 'Registered user tries to log out' do
    sign_in(user)

    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully'
  end
end
