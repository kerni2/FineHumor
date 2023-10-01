# frozen_string_literal: true

require 'rails_helper'

describe 'User can edit joke' do
  let(:user) { create(:user) }
  let(:joke) { create(:joke, user_id: user.id) }

  describe 'Authenticated user' do
    before do
      sign_in(user)
      visit joke_path(joke)
      click_on 'Edit'
    end

    it 'edit a joke' do
      fill_in 'Body', with: 'new text'
      click_on 'Submit joke!'

      expect(page).to have_content 'Joke updated!'
      expect(page).to have_content joke.title
      expect(page).to have_content 'new text'
    end

    it 'edit a joke with errors' do
      fill_in 'Body', with: ''
      click_on 'Submit joke!'

      expect(page).to have_content "Body can't be blank"
    end

    it "tries to edit other user's joke" do
      click_on 'Log out'
      user = create(:user)
      sign_in(user)
      visit joke_path(joke)

      expect(page).not_to have_content 'Edit'
    end
  end

  it 'Unregistered user tries to edit a joke' do
    visit edit_joke_path(joke)

    expect(page).not_to have_content 'Edit'
  end
end
