class AddIndexForStoragesOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :storages, :owner_id, :integer
    add_index :storages, :owner_id
  end
end
