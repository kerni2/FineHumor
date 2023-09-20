require 'rails_helper'

RSpec.describe Joke, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end
