class AddIndexPasswordDigestForAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :password_digest, :string
    add_index :accounts, :password_digest
  end
end
