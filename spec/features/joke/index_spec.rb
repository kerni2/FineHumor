# frozen_string_literal: true

require 'rails_helper'

describe 'User can see all jokes' do
  let!(:jokes) { create_list(:joke, 3) }

  before { visit jokes_path }

  it 'Unregistered user sees all jokes' do
    jokes.each do |joke|
      expect(page).to have_content joke.title
      expect(page).to have_content joke.body
    end
  end
end
