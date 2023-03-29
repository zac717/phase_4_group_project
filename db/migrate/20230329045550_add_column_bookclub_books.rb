class AddColumnBookclubBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclub_books, :current, :boolean
  end
end
