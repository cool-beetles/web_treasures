require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  def setup
   @treasure = treasures(:doll)    
  end

  test "should save treasure with owner, type or title" do 
    assert @treasure.valid?
  end

  test "should not save treasure without owner" do 
    @treasure.owner = nil
    assert_not @treasure.valid?
    assert_equal [:owner], @treasure.errors.keys
  end

  test "should not save treasure without title" do 
    @treasure.title = nil
    assert_not @treasure.valid?
    assert_equal [:title], @treasure.errors.keys
  end

  test "should not save treasure without type" do 
    @treasure.type = nil
    assert_not @treasure.valid?
    assert_equal [:type], @treasure.errors.keys
  end
end
