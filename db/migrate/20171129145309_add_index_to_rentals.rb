class AddIndexToRentals < ActiveRecord::Migration[5.1]
  def change
    add_column :rentals, :user, :integer
    add_index :rentals, :user
    add_column :rentals, :treasure, :integer
    add_index :rentals, :treasure
  end
end
