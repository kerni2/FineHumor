# frozen_string_literal: true

class Joke < ApplicationRecord
  include Authorship

  validates :title, :body, presence: true

  belongs_to :user
  has_many :joke_tags, dependent: :destroy
  has_many :tags, through: :joke_tags

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  scope :all_by_tags, lambda { |tags|
    jokes = includes(:user)
    jokes = if tags
              jokes.joins(:tags).where(tags:).preload(:tags)
            else
              jokes.includes(:joke_tags, :tags)
            end

    jokes.order(created_at: :desc)
  }
end
