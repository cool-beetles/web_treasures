require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  test "should save treasure with owner, type or title" do 
    treasure = Treasure.new(owner: users(:owner), type: types(:toy), title: "Barbie")
    assert treasure.valid?
  end

  test "should not save treasure without owner" do 
    treasure = Treasure.new(type: types(:toy), title: "Barbie")
    assert_not treasure.valid?
    assert_equal [:owner], treasure.errors.keys
  end

  test "should not save treasure without title" do 
    treasure = Treasure.new(owner: users(:owner), type: types(:toy))
    assert_not treasure.valid?
    assert_equal [:title], treasure.errors.keys
  end

  test "should not save treasure without type" do 
    treasure = Treasure.new(owner: users(:owner), title: "Barbie")
    assert_not treasure.valid?
    assert_equal [:type], treasure.errors.keys
  end
end
