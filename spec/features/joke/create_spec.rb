# frozen_string_literal: true

require 'rails_helper'

describe 'User can create joke' do
  let(:user) { create(:user) }

  describe 'Authenticated user' do
    before do
      sign_in(user)
      visit jokes_path
      click_on 'New joke'
    end

    it 'add a joke' do
      fill_in 'Title', with: 'Text'
      fill_in 'Body', with: 'text text text'

      click_on 'Submit joke!'

      expect(page).to have_content 'Joke created!'
      expect(page).to have_content 'Text'
      expect(page).to have_content 'text text text'
    end

    it 'add a joke with errors' do
      click_on 'Submit joke!'

      expect(page).to have_content "Title can't be blank"
    end
  end

  it 'Unregistered user tries to add a joke' do
    visit jokes_path

    expect(page).not_to have_content 'New joke'
  end
end
