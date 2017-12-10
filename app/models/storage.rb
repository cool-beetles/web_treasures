class Storage < ApplicationRecord
  has_many :treasures
  belongs_to :address, optional: true
  accepts_nested_attributes_for :address
  validates :name, length: { maximum: 15 }
  belongs_to :owner, class_name: "User"
end
