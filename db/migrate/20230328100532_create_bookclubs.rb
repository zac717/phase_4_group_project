class CreateBookclubs < ActiveRecord::Migration[7.0]
  def change
    create_table :bookclubs do |t|
      t.boolean :isAdmin
      t.string :name

      t.timestamps
    end
  end
end
