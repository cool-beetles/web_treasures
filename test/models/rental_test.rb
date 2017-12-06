require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  test "should save rental with user and treasure" do
    rental = Rental.new(user: users(:owner), treasure: treasures(:doll))
    assert rental.valid?
  end

  test "should not save rental without treasure" do
    rental = Rental.new(user: users(:friend))
    assert_not rental.valid?
    assert_equal [:treasure], rental.errors.keys
  end

  test "should not save rental without user" do
    rental = Rental.new(treasure: treasures(:puzzle))
    assert_not rental.valid?
    assert_equal [:user], rental.errors.keys
  end
end
