class AddIndexToStorages < ActiveRecord::Migration[5.1]
  def change
    add_column :storages, :address, :integer
    add_index :storages, :address
  end
end
