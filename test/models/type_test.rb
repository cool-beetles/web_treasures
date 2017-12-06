require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  test "should save type with proper name" do 
    type = types(:toy)
    assert type.valid?
  end

  test "should not save type with name longer than 10 letters" do  
    type = Type.new(name: "Books from library")
    assert_not type.valid?
    assert_equal [:name], type.errors.keys
  end
end
