require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "should save address with proper zip_code street and city" do 
    address = Address.new(street: addresses(:my_address).street, city: addresses(:my_address).city, zip_code: addresses(:my_address).zip_code)
    assert address.valid?
  end

  test "should not save address without street" do 
    address = Address.new(city: addresses(:my_address).city, zip_code: addresses(:my_address).zip_code)
    assert_not address.valid?
    assert_equal [:street], address.errors.keys
  end

  test "should not save address without city" do 
    address = Address.new(street: addresses(:my_address).street, zip_code: addresses(:my_address).zip_code)
    assert_not address.valid?
    assert_equal [:city], address.errors.keys
  end
  
  test "should not save address with zip_code longer than 7 characters" do 
    address = Address.new(street: addresses(:address_for_test).street, city: addresses(:address_for_test).city, zip_code: addresses(:address_for_test).zip_code)
    assert_not address.valid?
    assert_equal [:zip_code], address.errors.keys
  end
end
