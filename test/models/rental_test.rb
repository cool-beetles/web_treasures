require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  test "should save rental with user and treasure" do
    rental = rentals(:first_rental)
    assert rental.valid?
  end

  test "should not save rental without treasure" do
    rental = rentals(:first_rental)
    rental.treasure = nil
    assert_not rental.valid?
    assert_equal [:treasure], rental.errors.keys
  end

  test "should not save rental without user" do
    rental = rentals(:first_rental)
    rental.user = nil
    assert_not rental.valid?
    assert_equal [:user], rental.errors.keys
  end
end
