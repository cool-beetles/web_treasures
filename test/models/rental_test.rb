require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  def setup
    @rental = rentals(:first_rental)
  end

  test "should save rental with user and treasure" do
    assert @rental.valid?
  end

  test "should not save rental without treasure" do
    @rental.treasure = nil
    assert_not @rental.valid?
    assert_equal [:treasure], @rental.errors.keys
  end

  test "should not save rental without user" do
    @rental.user = nil
    assert_not @rental.valid?
    assert_equal [:user], @rental.errors.keys
  end
end
