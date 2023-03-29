class ChangeSuggestedByToTextBookclubBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :bookclub_books, :suggested_by, :text
  end
end
