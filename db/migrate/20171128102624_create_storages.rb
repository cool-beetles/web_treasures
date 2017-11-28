class CreateStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :storages do |t|
      t.string :name
      t.integer :address_id

      t.timestamps
    end
  end
end
