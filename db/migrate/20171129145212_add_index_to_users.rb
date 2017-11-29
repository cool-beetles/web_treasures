class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :integer
    add_index :users, :address
  end
end
