class CreateNewShows < ActiveRecord::Migration[5.2]
    def change
      create_table :shows do |t|
        t.references :user, index: true, foreign_key: true
        t.string :title
        t.string :genre

        t.timestamps
        end
    end
  end