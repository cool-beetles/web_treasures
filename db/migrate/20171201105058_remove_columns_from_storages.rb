class RemoveColumnsFromStorages < ActiveRecord::Migration[5.1]
  def change
    remove_column :storages, :address, :integer
  end
end
