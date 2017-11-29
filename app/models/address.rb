class Address < ApplicationRecord
  has_one :storage
  has_one :user
end
