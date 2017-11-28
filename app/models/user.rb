class User < ApplicationRecord
  has_many :treasures
  has_many :rentals
  belongs_to :address
end
