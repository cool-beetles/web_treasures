require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save user with proper first_name and last_name" do 
    user = User.new(first_name: "John", last_name: "Snow")
    assert user.valid?
  end

  test "should not save user with first name shorter than 3 letters" do  
    user = User.new(first_name: "Jo", last_name: "Snow")
    assert_not user.valid?
    assert_equal [:first_name], user.errors.keys
  end 

  test "should not save user with last name shorter than 3 letters" do  
    user = User.new(first_name: "John", last_name: "Sn")
    assert_not user.valid?
    assert_equal [:last_name], user.errors.keys
  end

  test "should not save user without first name" do
    user = User.new(last_name: "Snow")
    assert_not user.valid?
    assert_equal [:first_name], user.errors.keys
  end

  test "should not save user without last name" do
    user = User.new(first_name: "John")
    assert_not user.valid?
    assert_equal [:last_name], user.errors.keys
  end
end
