class AddIndexForRentals < ActiveRecord::Migration[5.1]
  def change
    add_index :rentals, :user_id
    add_index :rentals, :treasure_id
  end
end
