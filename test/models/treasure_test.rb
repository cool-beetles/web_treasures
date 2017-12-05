require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  owner = User.new(first_name: "Ada", last_name: "Kucinska")
  type = Type.new(name: "Toys")

  test "should save treasure with owner, type or title" do 
    treasure = Treasure.create(owner: owner, type: type, title: "Barbie")
    assert treasure.valid?
  end

  test "should not save treasure without owner" do 
    treasure = Treasure.create(type: type, title: "Barbie")
    assert_not treasure.valid?
    assert_equal [:owner], treasure.errors.keys
  end

  test "should not save treasure without title" do 
    treasure = Treasure.create(owner: owner, type: type)
    assert_not treasure.valid?
    assert_equal [:title], treasure.errors.keys
  end

  test "should not save treasure without type" do 
    treasure = Treasure.create(owner: owner, title: "Barbie")
    assert_not treasure.valid?
    assert_equal [:type], treasure.errors.keys
  end
end
