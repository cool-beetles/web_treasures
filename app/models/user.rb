class User < ApplicationRecord
  has_many :treasures, foreign_key: 'owner_id'
  has_many :rentals
  has_many :storages, foreign_key: 'owner_id'
  has_one :account
  belongs_to :address, optional: true
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
end
# has many through 
# Rentals.where(treasure_id: Treasure.where(owner_id: current_user.id))
# current_user.lend_rentals