# frozen_string_literal: true

require 'rails_helper'

describe 'User can see jokes and choose jokes by tag' do
  let!(:joke_with_tags) { create(:joke_with_tags) }
  let!(:jokes) { create_list(:joke, 3) }

  before { visit jokes_path }

  describe 'Unauthenticated user' do
    it 'can see tag' do
      expect(page).to have_content 'MyTag'
    end

    it 'can see all jokes' do
      jokes.each do |joke|
        expect(page).to have_content joke.title
        expect(page).to have_content joke.body
      end
    end
  end

  describe 'Unauthenticated user choose joke with tag' do
    before { click_on 'MyTag' }

    it 'can see tag' do
      expect(page).to have_content 'MyTag'
    end

    it 'can not see jokes without tag' do
      jokes.each do |joke|
        expect(page).not_to have_content joke.title
        expect(page).not_to have_content joke.body
      end
    end
  end
end
