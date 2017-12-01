class RemoveColumnsFromRentals < ActiveRecord::Migration[5.1]
  def change
    remove_column :rentals, :user, :integer
    remove_column :rentals, :treasure, :integer
  end
end
