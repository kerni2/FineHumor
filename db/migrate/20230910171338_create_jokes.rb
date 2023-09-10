class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
