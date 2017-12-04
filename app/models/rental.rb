class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :treasure
  validates_presence_of :user, :treasure
end
