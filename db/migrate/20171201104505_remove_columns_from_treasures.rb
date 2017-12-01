class RemoveColumnsFromTreasures < ActiveRecord::Migration[5.1]
  def change
    remove_column :treasures, :user, :integer
    remove_column :treasures, :type, :integer
    remove_column :treasures, :storage, :integer
  end
end
