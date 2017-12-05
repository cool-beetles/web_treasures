require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "should save address with proper zip_code street and city" do 
    address = Address.create(street: "Wilczynskiego", city: "Olsztyn", zip_code: "10-900")
    assert address.valid?
  end

  test "should not save address without street" do 
    address = Address.create(city: "Olsztyn", zip_code: "10-900")
    assert_not address.valid?
    assert_equal [:street], address.errors.keys
  end

  test "should not save address without city" do 
    address = Address.create(street: "Wilczynskiego", zip_code: "10-900")
    assert_not address.valid?
    assert_equal [:city], address.errors.keys
  end
  
  test "should not save address with zip_code longer than 7 characters" do 
    address = Address.create(street: "Wilczynskiego", city: "Olsztyn", zip_code: "100-9000")
    assert_not address.valid?
    assert_equal [:zip_code], address.errors.keys
  end
end
