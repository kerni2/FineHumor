# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to have_many(:jokes).through(:joke_tags) }
end
