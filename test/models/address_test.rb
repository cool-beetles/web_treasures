require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "should not save address with too long zip_code or without street and city" do 
    address = Address.create(street: "Wilczynskiego", city: "Olsztyn", zip_code: "10-900")
    assert address.valid?

    address = Address.create(city: "Olsztyn", zip_code: "10-900")
    assert_not address.valid?

    address = Address.create(street: "Wilczynskiego", zip_code: "10-900")
    assert_not address.valid?

    address = Address.create(street: "Wilczynskiego", city: "Olsztyn", zip_code: "100-9000")
    assert_not address.valid?
  end
end
