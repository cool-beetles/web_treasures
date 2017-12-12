class RemoveColumnPasswordFromAccount < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :password, :string
  end
end
