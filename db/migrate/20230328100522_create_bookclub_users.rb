class CreateBookclubUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :bookclub_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookclub, null: false, foreign_key: true
      t.boolean :is_admin
      t.timestamps precision: 6, null: false
    end
    add_index :bookclub_users, [:user_id, :bookclub_id], unique: true, name: "index_bookclub_users_on_user_and_bookclub"
  end
end
