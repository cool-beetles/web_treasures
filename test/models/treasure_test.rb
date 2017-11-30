require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  test "should not save treasure without owner, type or  title" do 
    treasure = Treasure.new
    assert_not treasure.valid?
    assert_equal [:owner, :type, :title], treasure.error.keys
  end
end
