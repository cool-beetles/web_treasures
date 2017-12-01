class AddIndexForStorages < ActiveRecord::Migration[5.1]
  def change
    add_index :storages, :address_id
  end
end
