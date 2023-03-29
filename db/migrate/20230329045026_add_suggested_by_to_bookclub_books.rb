class AddSuggestedByToBookclubBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclub_books, :suggested_by, :string
  end
end
