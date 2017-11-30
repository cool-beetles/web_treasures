class CreateTreasures < ActiveRecord::Migration[5.1]
  def change
    create_table :treasures do |t|
      t.belongs_to :owner_id
      t.integer :type_id
      t.integer :storage_id
      t.string :trashed
      t.string :title
      t.string :description
      t.string :special_note

      t.timestamps
    end 
  end
end
