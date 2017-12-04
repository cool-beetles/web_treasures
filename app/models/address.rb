class Address < ApplicationRecord
  has_one :storage
  has_one :user
  validates_presence_of :street, :city
  validates :zip_code, length: { maximum: 7 }
end
