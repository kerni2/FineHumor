# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }

  it { is_expected.to belong_to(:author).class_name('User') }
end
