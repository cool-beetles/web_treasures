class AddIndexForUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :address_id
  end
end
