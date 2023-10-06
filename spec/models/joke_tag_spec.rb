require 'rails_helper'

RSpec.describe JokeTag do
  it { is_expected.to belong_to(:tag) }
  it { is_expected.to belong_to(:joke) }
end
