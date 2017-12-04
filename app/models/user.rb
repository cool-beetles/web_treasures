class User < ApplicationRecord
  has_many :treasures
  has_many :rentals
  belongs_to :address, optional: true
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
end
