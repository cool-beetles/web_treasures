require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  test "should not save treasure without owner, type or title" do 
    owner = User.new(first_name: "Ada", last_name: "Kucinska")
    type = Type.new(name: "Toys")
    
    treasure = Treasure.create(owner: owner.id, type: type.id, title: "Barbie")
    assert_not treasure.valid?

    treasure = Treasure.create(type: type.id, title: "Barbie")
    assert_not treasure.valid?

    treasure = Treasure.create(owner: owner.id, type: type.id)
    assert_not treasure.valid?

    treasure = Treasure.create(owner: owner.id, title: "Barbie")
    assert_not treasure.valid?
  end
end
