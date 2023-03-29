class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.belongs_to :bookclub_book, null: false, foreign_key: true
      t.text :pages
      t.date :deadline
      t.boolean :complete

      t.timestamps
    end
  end
end
