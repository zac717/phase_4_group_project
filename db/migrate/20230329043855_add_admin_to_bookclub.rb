class AddAdminToBookclub < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclubs, :admin, :string
    remove_column :bookclubs, :isAdmin
  end
end
