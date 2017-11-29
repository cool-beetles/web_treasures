class Storage < ApplicationRecord
  has_many :treasures
  belongs_to :address
end
