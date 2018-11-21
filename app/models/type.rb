class Type < ApplicationRecord
  has_many :treasures
  validates :name, length: { maximum: 10 }
end