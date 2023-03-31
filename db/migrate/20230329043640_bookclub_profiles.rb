class BookclubProfiles < ActiveRecord::Migration[7.0]
  def change
   create_table :bookclub_profiles do |t|
    t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :bookclub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
