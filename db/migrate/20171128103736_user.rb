class User < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    t.string :first_name
    t.string :last_name
    t.integer :age
    t.integer :address_id

    t.timestamps
    end
  end
end
