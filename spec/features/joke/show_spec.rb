# frozen_string_literal: true

require 'rails_helper'

describe 'User can see the joke' do
  let(:joke) { create(:joke) }

  before { visit joke_path(joke) }

  it 'Unregistered user see the joke' do
    expect(page).to have_content joke.title
    expect(page).to have_content joke.body
  end
end
