class AddIndexForTreasures < ActiveRecord::Migration[5.1]
  def change
    add_index :treasures, :owner_id
    add_index :treasures, :type_id
    add_index :treasures, :storage_id
  end
end
