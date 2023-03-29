class RemoveColumnWishlistFromBookclubBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookclub_books, :wishlist, :archived
  end
end
