require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  test "should not save treasure without owner, type or title" do
    user = User.new(first_name: "John", last_name: "Snow")
    type = Type.new(name: "Toys")
    treasure = Treasure.new(owner: user.id, type: type.id, title: "Darts")

    rental = Rental.create(user: user.id, treasure: treasure.id)
    assert_not rental.valid?

    rental = Rental.create(user: user.id)
    assert_not rental.valid?

    rental = Rental.create(treasure: treasure.id)
    assert_not rental.valid?
  end
end
