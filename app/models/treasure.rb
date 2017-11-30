class Treasure < ApplicationRecord
  has_many :rentals
  belongs_to :type
  belongs_to :storage
  belongs_to :owner , :class_name => "User", :foreign_key => 'owner_id'
end
