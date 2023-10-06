class Tag < ApplicationRecord
  validates :title, presence: true

  has_many :joke_tags, dependent: :destroy
  has_many :jokes, through: :joke_tags
end
