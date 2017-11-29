class AddIndexToTreasures < ActiveRecord::Migration[5.1]
  def change
    add_column :treasures, :user, :integer
    add_index :treasures, :user
    add_column :treasures, :type, :integer
    add_index :treasures, :type
    add_column :treasures, :storage, :integer
    add_index :treasures, :storage
  end
end
