require 'test_helper'

class RentalTest < ActiveSupport::TestCase
    user = User.new(first_name: "John", last_name: "Snow")
    type = Type.new(name: "Toys")
    treasure = Treasure.new(owner: user, type: type, title: "Darts")

  test "should save rental with user and treasure" do
    rental = Rental.create(user: user, treasure: treasure)
    assert rental.valid?
  end

  test "should not save rental without treasure" do
    rental = Rental.create(user: user)
    assert_not rental.valid?
    assert_equal [:treasure], rental.errors.keys
  end

  test "should not save rental without user" do
    rental = Rental.create(treasure: treasure)
    assert_not rental.valid?
    assert_equal [:user], rental.errors.keys
  end
end
