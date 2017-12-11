class User < ApplicationRecord
  has_many :treasures, foreign_key: 'owner_id'
  has_many :rentals
  has_many :storages, foreign_key: 'owner_id'
  has_one :account, foreign_key: 'user_id'
  belongs_to :address, optional: true
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
end
