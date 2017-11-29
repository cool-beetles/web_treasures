class Treasure < ApplicationRecord
  has_many :rentals
  belongs_to :type
  belongs_to :storage
  belongs_to :user
end
