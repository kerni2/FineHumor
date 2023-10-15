# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :joke_tags, dependent: :destroy
  has_many :jokes, through: :joke_tags

  validates :title, presence: true, uniqueness: true
end
