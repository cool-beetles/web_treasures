require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save user with proper first_name and last_name" do 
    user = User.create(first_name: users(:owner).first_name, last_name: users(:owner).last_name)
    assert user.valid?
  end

  test "should not save user with first name shorter than 3 letters" do 
    user = User.create(first_name: users(:too_short_first_name).first_name, last_name: users(:too_short_first_name).last_name)
    assert_not user.valid?
    assert_equal [:first_name], user.errors.keys
  end 

  test "should not save user with last name shorter than 3 letters" do  
    user = User.create(first_name: users(:too_short_last_name).first_name , last_name: users(:too_short_last_name).last_name)
    assert_not user.valid?
    assert_equal [:last_name], user.errors.keys
  end

  test "should not save user without first name" do
    user = User.create(last_name: users(:friend).last_name)
    assert_not user.valid?
    assert_equal [:first_name], user.errors.keys
  end

  test "should not save user without last name" do
    user = User.create(first_name: users(:owner).first_name)
    assert_not user.valid?
    assert_equal [:last_name], user.errors.keys
  end
end
