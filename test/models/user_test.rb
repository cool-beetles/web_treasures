require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user with too short first_name and last_name or without them" do 
  user = User.new(first_name: "John", last_name: "Snow")
  assert_not user.invalid?
  
  user = User.new(first_name: "Jo", last_name: "Snow")
  assert_not user.valid?
  
  user = User.new(first_name: "John", last_name: "Sn")
  assert_not user.valid?

  user = User.new(last_name: "Snow")
  assert_not user.valid?

  user = User.new(first_name: "John")
  assert_not user.valid?
  end
end
