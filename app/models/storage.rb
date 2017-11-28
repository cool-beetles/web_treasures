class Storage < ApplicationRecord
  has_many :treasures
  belogs_to :address
end
