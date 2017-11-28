class Rental < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :treasure_id
      t.date :start_date
      t.date :due_date
      t.date :return_date

      t.timestamps
    end
  end
end
