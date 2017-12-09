class Treasure < ApplicationRecord
  scope :untrashed, -> { where(trashed: 0) }
  scope :trashed, -> { where(trashed: 1) }
  has_many :rentals
  belongs_to :type
  belongs_to :storage, optional: true
  belongs_to :owner, class_name: "User", foreign_key: 'owner_id'
  validates_presence_of :title 
end
