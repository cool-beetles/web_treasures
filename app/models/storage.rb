class Storage < ApplicationRecord
  has_many :treasures
  belongs_to :address, optional: true
  validates :name, length: { maximum: 15 }
  belongs_to :owner, class_name:"User"
end
