class CreateJokeTags < ActiveRecord::Migration[7.0]
  def change
    create_table :joke_tags do |t|
      t.belongs_to :joke, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :joke_tags, %i[joke_id tag_id], unique: true
  end
end
