require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @address = addresses(:my_address)
  end

  test "should save address with proper zip_code street and city" do 
    assert @address.valid?
  end

  test "should not save address without street" do 
    @address.street = nil
    assert_not @address.valid?
    assert_equal [:street], @address.errors.keys
  end

  test "should not save address without city" do 
    @address.city = nil
    assert_not @address.valid?
    assert_equal [:city], @address.errors.keys
  end
  
  test "should not save address with zip_code longer than 7 characters" do 
    address = Address.new(street: "Wilczynskiego", city: "Olsztyn", zip_code: "110-1101")
    assert_not address.valid?
    assert_equal [:zip_code], address.errors.keys
  end
end
