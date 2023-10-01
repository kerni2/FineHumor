# frozen_string_literal: true

require 'rails_helper'

describe 'User can delete joke' do
  let(:user) { create(:user) }
  let(:joke) { create(:joke) }

  describe 'Authenticated user' do
    before do
      sign_in(user)
      visit joke_path(joke)
      click_on 'Destroy'
    end

    it 'delete a joke' do
      expect(page).to have_content 'Joke deleted!'
    end
  end

  it 'Unregistered user tries to delete a joke' do
    visit edit_joke_path(joke)

    expect(page).not_to have_content 'Destroy'
  end
end
