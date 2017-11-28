class Address < ApplicationRecord
  belongs_to :storage
  belongs_to :user
end
