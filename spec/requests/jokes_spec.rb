require 'rails_helper'

RSpec.describe "Jokes", type: :request do
  let(:valid_attributes) {
    { title: "MyString", body: "MyText" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Joke.create! valid_attributes
      get jokes_url
      expect(response).to be_successful
    end
  end
end
