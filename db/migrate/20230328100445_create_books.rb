class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :imageURL
      t.string :title
      t.string :series
      t.string :description
      t.integer :pages
      t.string :publicationDate
      t.string :genres
      t.string :author

      t.timestamps
    end
  end
end
