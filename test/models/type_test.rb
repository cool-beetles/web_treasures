require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  test "should save type with proper name" do 
    type = Type.create(name: types(:toy).name)
    assert type.valid?
  end

  test "should not save type with name longer than 10 letters" do  
    type = Type.create(name: types(:book_too_long_name).name)
    assert_not type.valid?
    assert_equal [:name], type.errors.keys
  end
end
