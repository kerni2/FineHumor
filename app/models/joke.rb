# frozen_string_literal: true

class Joke < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
