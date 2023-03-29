class RemoveAdminFromBookclubs < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookclubs, :admin, :string
  end
end
