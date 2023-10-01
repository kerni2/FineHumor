# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jokes' do
  include Warden::Test::Helpers

  let(:user) { create(:user) }

  let(:valid_attributes) do
    { title: 'MyString', body: 'MyText', user_id: user.id }
  end

  let(:invalid_attributes) do
    { title: '', body: 'MyText' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Joke.create! valid_attributes
      get jokes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      joke = Joke.create! valid_attributes
      get joke_url(joke)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    before { sign_in user }

    it 'renders a successful response' do
      get new_joke_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    before { sign_in user }

    it 'render a successful response' do
      joke = Joke.create! valid_attributes
      get edit_joke_url(joke)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before { sign_in user }

    context 'with valid parameters' do
      it 'creates a new joke' do
        expect do
          post jokes_url, params: { joke: valid_attributes }
        end.to change(Joke, :count).by(1)
      end

      it 'redirects to the created joke' do
        post jokes_url, params: { joke: valid_attributes }
        expect(response).to redirect_to(jokes_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new joke' do
        expect do
          post jokes_url, params: { joke: invalid_attributes }
        end.not_to change(Joke, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post jokes_url, params: { joke: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    before { sign_in user }

    context 'with valid parameters' do
      let(:new_attributes) do
        { title: 'MyNewString', body: 'MyNewText' }
      end

      it 'redirects to the joke' do
        joke = Joke.create! valid_attributes
        patch joke_url(joke), params: { joke: new_attributes }
        joke.reload
        expect(response).to redirect_to(jokes_url)
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        joke = Joke.create! valid_attributes
        patch joke_url(joke), params: { joke: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    before { sign_in user }

    it 'destroys the requested joke' do
      joke = Joke.create! valid_attributes
      expect do
        delete joke_url(joke)
      end.to change(Joke, :count).by(-1)
    end

    it 'redirects to the jokes list' do
      joke = Joke.create! valid_attributes
      delete joke_url(joke)
      expect(response).to redirect_to(jokes_url)
    end
  end
end
