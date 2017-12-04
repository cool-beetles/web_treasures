require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  test "should not save type with too long name" do 
    type = Type.new(name: "Books")
    assert_not type.invalid?

    type = Type.new(name: "Books from library")
    assert_not type.valid?
  end
end
