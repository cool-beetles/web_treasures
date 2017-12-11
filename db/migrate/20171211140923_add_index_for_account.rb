class AddIndexForAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :user_id, :integer
    add_index :accounts, :user_id
  end
end
