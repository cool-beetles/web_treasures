require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  def setup
    @type = types(:toy)
  end
  
  test "should save type with proper name" do
    assert @type.valid?
  end

  test "should not save type with name longer than 10 letters" do
    type = Type.new(name: "Books from library" )
    assert_not type.valid?
    assert_equal [:name], type.errors.keys
  end
end
