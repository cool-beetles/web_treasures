class Treasure < ApplicationRecord
  has_many :types
  has_many :rentals
  belongs_to :storage
  belongs_to :user
end
