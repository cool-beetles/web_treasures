class Storage < ApplicationRecord
  has_many :treasures, foreign_key: 'owner_id'
  belongs_to :address, optional: true
  validates :name, length: { maximum: 15 }
end
