# frozen_string_literal: true

class AddUserToJokes < ActiveRecord::Migration[7.0]
  def change
    add_reference :jokes, :user, foreign_key: { to_table: :users }
  end
end
